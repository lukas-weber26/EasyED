#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

enum MODE {COMMAND, EDIT};
enum COMAND_TYPE {SINGLE, DOUBLE, LINE_ERROR};

typedef struct text_line{
	char * text;
	int line_number;
	int line_length;
	struct text_line* next_line;
} text_line;

int write();
int delete(int start, int end);
int replace();
int append(int line);
int prepend(int line);
int replace_words();
int search();
int print(int start, int end);
int numbers(int start, int end);
int move(int start, int end);
int copy(int start, int end);
void move_lines(text_line * copy_from, text_line * copy_to);
int resolve_targets(char *start_count, int *starting_line, int *ending_line);
int run_comand(char * input_buffer, int input_count, int * mode);
int is_in_string(char * s, char c);
int get_max_line_number();
int resolve_target(char * s);
text_line * printLine(text_line *l);
text_line * new_blank_line();
text_line * make_line(char * line, int length, int number);
void print_doc(text_line * l);
char * filename_handler (char * fname);
text_line * new_node();
void add_text_to_node(text_line * line, char * buff);
void initialize (int argc, char * argv[]);
void print_prompt (int mode);
void fix_line_numbers();
void copy_to_node(text_line * source, text_line * current_line);

text_line * first_line;
text_line * current_line;
FILE * fd;

text_line * make_line(char * line, int length, int number) {
	text_line * l = malloc(sizeof(text_line));
	l ->text = malloc(sizeof(char)*(length+1));
	strncpy(l->text, line, length);
	l->text[length] = '\0';
	l->line_number	= number;
	l->line_length = length;
	l->next_line = NULL;
	return l;
}

text_line * new_blank_line() {
	text_line * l = malloc(sizeof(text_line));
	l ->text = malloc(sizeof(char)*(1));
	l->text[0] = '\0'; 
	l->line_number	= 1;
	l->line_length = 0;
	l->next_line = NULL;
	return l;
}

text_line * printLine(text_line *l) {
	printf("%d: %s", l -> line_number, l->text);
	return l->next_line;
}

void print_doc(text_line * l) {
	text_line * current = l;
	while (current) {
		current = printLine(current);
	}
}

void print_prompt (int mode) {
	if (mode == COMMAND) {
		printf("%d: ",current_line->line_number);
	} else {
		printf("%d> ",current_line->line_number);
	}
}

int run_input(int mode, char * input_buffer, int input_count) {
	int m = mode;

	switch (mode) {
		case (COMMAND):
			run_comand(input_buffer, input_count, &m);
			break;
		case (EDIT):
			add_text_to_node(current_line, input_buffer);
			m = COMMAND;
			break;
		default:
			printf("Bad mode detected.\n");
			exit(0);
			break;
	}
		
	return m;
}

int main(int argc, char * argv[]) {
	
	initialize(argc, argv);
	
	int mode = COMMAND; 
	char *input_buffer;
	unsigned long input_len;
	unsigned long input_buff_len;

	printf("%d: ",current_line->line_number);
	while (1) {
		input_len = getline(&input_buffer, &input_buff_len, stdin);
		if (input_len > 512) {
			printf("Error. Input buffer overflow. Line discarded.\n");
		} else {
			mode = run_input(mode, input_buffer, input_len+1);
		}
		print_prompt(mode);
	}

}

int is_in_string(char * s, char c) {
	for (int i =0; i< strlen(s); s++) {
		if (s[i] == c) {
			return 1;
		}
	}
	return 0;
}

int get_max_line_number() {
	text_line * it = first_line;
	while (it->next_line) {
		it = it->next_line;
	}
	return it->line_number;
}

int resolve_target(char * s) {
	int val;
	switch (s[0]) {
		case '\0':
			//printf("odd case.\n");
			return current_line->line_number;
			break;
		case '+':
			//printf("plus case.\n");
			return (current_line->line_number)+1;
			break;
		case '$':
			//printf("$ case.\n");
			return get_max_line_number();
			break;
		case ' ':
			//printf("space case.\n");
			return 1;
		default:
			//printf("default case.\n");
			val = atoi(s); //caution, 0 on error.		
			return val;	
	}
}


//return 0 if only first arg counts, returns two if both count.
int resolve_targets(char *start_count, int *starting_line, int *ending_line) {
	//basically splitting this thing into two strings, pre comma and post comma. Potentially only one string exists. that's an L.
	int buff_size = strlen(start_count) +1;
	char pre_comma[buff_size];
	char post_comma[buff_size];
	int count = 0;
	int offset = 0;

	while((start_count[count] != ',') && (start_count[count] != '\0')) {
		pre_comma[count-offset] = start_count[count];
		count ++;
	}
	pre_comma[count-offset] = '\0';
	
	if (start_count[count] != '\0') {
		count ++;
		offset = count;
		
		while((start_count[count] != ',') && (start_count[count] != '\0')) {
			post_comma[count-offset] = start_count[count];
			count ++;
		}
		post_comma[count-offset] = '\0';
	} else {
		post_comma[0] = '\0';
	}

	//printf("Pre,Post comma: %s.%s.",pre_comma,post_comma); //danger: This section has caused probelms in the past.

	*starting_line = resolve_target(pre_comma);
	*ending_line = resolve_target(post_comma);

	if (*starting_line == 0){
		printf("Line error - first num is zero.");
		return LINE_ERROR;
	} else if (*ending_line == 0) {
		printf("Line error - second num is zero.");
		return LINE_ERROR;
	}

	if (strlen(post_comma) == 0) {
		return SINGLE;
	} else {
		return DOUBLE;
	}
}

int run_comand(char * input_buffer, int input_count, int * mode) {
	while (input_buffer[0] == '\n') {
		input_buffer = input_buffer + 1;
	}
	
	//split the input buffer into two parts: comand and specifier
	char start_count[512];	
	char comand[512];
	int current = 0;
	int offset = 0; 

	while ((is_in_string("+-,$1234567890", input_buffer[current]) == 1) && (input_buffer[current] != '\0')) {
		start_count[current-offset] = input_buffer[current];	
		current ++;
	}
	start_count[current-offset] = '\0';

	offset = current; 
	while ((input_buffer[current] != '\0')) {
		comand[current-offset] = input_buffer[current];	
		current ++;
	}
	comand[current-offset] = '\0';
	
	int starting_line = 0;
	int ending_line = 0;
	int single_line_command = resolve_targets(start_count,&starting_line, &ending_line);

	//printf("Comand: %s, Starting line %d, ending line %d;", comand, starting_line, ending_line);

	if (single_line_command == SINGLE) {
		//printf("Single line comand:%d. ", starting_line);
	} else if (single_line_command == DOUBLE){
		//printf("Doubleline comand:%d.%d. ", starting_line,ending_line);
	} else {
		printf("Invalid line numbers. \n");
		return 0; //THIS NEEDS SOME MORE ADVANCED HANDLING OR AT LEAST A MORE OFFICIAL RETURN TYPE.
	}

	switch (comand[0]) {
		case('w'):
			write();
			break;
		case('d'):
			printf("Delete:%s:%s.\n",start_count,comand);
			delete(starting_line, ending_line);
			break;
		case('r'):
			printf("Replace line:%s:%s.\n",start_count,comand);
			replace();
			break;
		case('a'):
			//printf("Append:%s:%s.\n",start_count,comand);
			append(starting_line);
			*mode = EDIT;
			break;
		case('o'):
			prepend(starting_line);
			*mode = EDIT;
			break;
		case('s'):
			printf("Replace words:%s:%s.\n",start_count,comand);
			replace_words();
			break;
		case('g'):
			printf("Search:%s:%s.\n",start_count,comand);
			search();
			break;
		case('p'):
			print(starting_line,ending_line);
			break;
		case('m'):
			move(starting_line, ending_line);
			break;
		case('c'):
			copy(starting_line, ending_line);
			*mode = COMMAND;
			break;
		case('n'):
			//printf("Numbers (program stats.):%s:%s.\n",start_count,comand);
			numbers(starting_line,ending_line);
			break;
		case('q'):
			printf("Exiting.\n");
			exit(0);	
			break;
		default:
			printf("Invalid comand. \n");
			break;
	}

	//returns: -1 is the target mode is comand mode? 
}

int print(int start, int end) {
	text_line * temp = first_line;
	int ln = 0;
	while (temp) {
		ln = temp -> line_number;
		if (ln >= start) {
			if (ln <= end) {
				printf("%d: %s", ln, temp->text);
			} else {
				break;
			}
		}
		temp = temp -> next_line;
	}
	return 1;
}

int numbers(int start, int end) {
	text_line * temp = first_line;
	int ln = 0;
	int count = 0;
	int bytes = 0;
	while (temp) {
		if (ln != 0) {printf("\n");};
		ln = temp -> line_number;
		if (ln >= start) {
			if (ln <= end) {
				count ++;
				bytes += temp ->line_length;
			} else {
				break;
			}
		}
		temp = temp -> next_line;
	}
	printf("%d lines. %d characters.\n",count,bytes);
	return 1;
};

//replace is the same thing as delete but with slightly more steps.
int replace() {}; 

int delete(int start, int end) {
	
};

//ok maybe this one is okay lmao
int move(int start, int end) {
	text_line * current = first_line;
	text_line * target = first_line;
	text_line * source = first_line; 
	text_line * new;
	new = new_node();

	if (end == 1) {
		while (current) {
			if (current -> line_number == start) {source = current;}
			current = current -> next_line;
		}
			
		//in this case, need to to the whole add new first line thing 
		move_lines(first_line, new);	
		current_line = first_line;
		

	} else {
		while (current) {
			if (current -> line_number == end -1) {target = current;}
			if (current -> line_number == start) {source = current;}
			current = current -> next_line;
		}

		new -> next_line =target -> next_line;
		target -> next_line= new;
		current_line = new;
	}

	text_line * to_delete;
	copy_to_node(source, current_line);

	if (source ->line_number == first_line -> line_number) {
		//in caase source node is the first node 
		to_delete = first_line -> next_line;
		move_lines(first_line->next_line, first_line);
		
			
	} else { 
		//in case the source node is not the first node 
		current = first_line;
		while (current -> next_line) {
			if (current -> next_line == source) {
				break;
			}
			current = current ->next_line;
		}
		to_delete = current -> next_line;
		if (to_delete -> next_line) {
			current -> next_line= to_delete -> next_line; 
		} else {
			current -> next_line = NULL;
		}
	}

	free(to_delete ->text);
	free(to_delete);

	fix_line_numbers();
	return 1;
};

void copy_to_node(text_line * source, text_line* target) {
	free(target->text);
	int len = strlen(source -> text);
	target -> text = malloc(sizeof(char) * (len+1)); 
	strcpy(target-> text , source->text);
	target -> text[len] = '\0';
	target ->line_length = source -> line_length;
}

int copy(int start, int end) {
	text_line * current = first_line;
	text_line * target = first_line;
	text_line * source = first_line; 
	text_line * new;
	new = new_node();

	if (end == 1) {
		while (current) {
			if (current -> line_number == start) {source = current;}
			current = current -> next_line;
		}
			
		//in this case, need to to the whole add new first line thing 
		move_lines(first_line, new);	
		current_line = first_line;
		

	} else {
		while (current) {
			if (current -> line_number == end -1) {target = current;}
			if (current -> line_number == start) {source = current;}
			current = current -> next_line;
		}

		new -> next_line =target -> next_line;
		target -> next_line= new;
		current_line = new;
	}


	copy_to_node(source, current_line);
	fix_line_numbers();
	return 1;
};

//more complicated (requies io stuff to work)
int write() {
	char * fn = filename_handler(NULL);
	fd = fopen(fn, "w");
	if (fd != NULL) {
		printf("Writing to file %s.\n", fn);	
	} else {
		printf("Error writing to file %s.\n", fn);	
		return 0;
	}

	text_line * current = first_line;
	while (current) {
		fwrite(current->text, current->line_length, sizeof(char), fd); //L maybe
		current = current ->next_line;
	}

	fclose(fd);
};

char * filename_handler (char * fname) {
	static char * fileName;
	if (fname != NULL) {
		fileName = malloc(sizeof(char) * (strlen(fname) + 1));
		strcpy(fileName, fname);
		return fname;
	} else		fname = fileName;{
		return fileName;
	}
}

text_line * get_last_line() {
	text_line * last_line = first_line;
	while (last_line->next_line) {
		last_line = last_line -> next_line;
	};
	return last_line;
}

void fix_line_numbers() {
	text_line * current = first_line;
	int count = 1;
	while (current) {
		current -> line_number = count; 
		count ++;
		current = current->next_line;
	}
}

text_line * new_node() {
	text_line * new = malloc(sizeof(text_line));
	new ->next_line = NULL;
	new ->line_number = 0;
	new ->line_length= 0;
	new ->text = NULL;
	return new;
}

void add_text_to_node(text_line * line, char * buff) {
	line ->text = malloc(sizeof(char) * (1+strlen(buff)));
	strcpy(line->text,buff);
	line ->line_length = strlen(buff);
}

int append(int line) {
	text_line * current = first_line;
	text_line * to_append;
	while (current) {
		if (current->line_number == line) {
			to_append = current;
			break;
		}
		current = current -> next_line;
	}

	if (current == NULL) {
		to_append = get_last_line();
	}

	//make a new node.
	text_line * new_line = new_node();
	current_line = new_line;

	if (to_append ->next_line) {
		new_line -> next_line = to_append -> next_line;
		to_append -> next_line = new_line;
	} else {
		to_append -> next_line = new_line;
	}

	fix_line_numbers();
	return 1;
};

void move_lines(text_line * copy_from, text_line * copy_to) {
	copy_to ->next_line = copy_from ->next_line;
	copy_to ->line_number = copy_from -> line_number;
	copy_to ->text = copy_from -> text;
	copy_to ->line_length = copy_from -> line_length;

	copy_from -> next_line = copy_to;
	copy_from -> line_number = 1;
	copy_from -> text = NULL;
	copy_from -> line_length = 0;
}

int prepend(int line) {
	text_line * current = first_line;
	text_line * new = new_node();
	
	if (current->line_number == line) {
		//prepend first 
		move_lines(first_line,new);		
		current_line = first_line;
	} else {
		while (current->next_line) {
			if (current -> next_line->line_number == line) {break;}	
			current = current -> next_line;
		}
		//append to current 
		new -> next_line = current-> next_line;
		current -> next_line = new;
		current_line = new;
	}

	fix_line_numbers();
	return 1;
};

//regex type things 
int replace_words() {};
int search() {};

void initialize (int argc, char * argv[]) {
	if (argc != 2) {
		printf("Error: No filename provided.\n");
		exit(0);
	} 

	char * filename = argv[1];
	fd = fopen(filename, "r+");
	filename_handler(filename);


	if (!fd) {
		printf("No existing file found. Creating new file: %s.\n",filename);
		fd = fopen(filename, "w");
		
		if (!fd)  {
			printf("Failed to create new file.\n");
			exit(errno);
		}
		
		first_line = new_blank_line();
		printf("New file %s created.\n", filename);

	} else {
		char * line = NULL;
		size_t len = 0;
		ssize_t nread;
		int line_number = 1;
		if ((nread = getline(&line,&len,fd)) != -1) {
			first_line = make_line(line,nread,line_number);	
			text_line * next_line;
			text_line * prev_line = first_line;
	
			while ((nread = getline(&line,&len,fd)) != -1) {
				line_number ++;
				next_line = make_line(line,nread,line_number);	
				prev_line -> next_line = next_line;
				prev_line = next_line;
			}

			//do I need to free line?
			printf("Loaded document %s. %d lines read:\n", filename, line_number);
			free(line);
			print_doc(first_line);

		} else {
			first_line = new_blank_line();
			printf("Loaded document %s. 0 lines read.\n", filename);
		}
	}

	current_line = first_line;
	fclose(fd); //once done loading the file, leave it.
}

