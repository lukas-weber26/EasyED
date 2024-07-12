#include <string.h>
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

#define TEST 1

int find(char * line, char * target);
int replace(char **buffer, char * line, char * target, char * replacement);

#if TEST 
void test();
int test_find ();
void test_replace();
#endif 

int main() {
	test();	
	return 0;
}

int find(char * line, char * target) {
	assert(strlen(line));
	assert(strlen(target));
	if (strstr(line, target)) {
		return 1;
	}
	return 0;
}

int replace(char **buffer, char * line, char * target, char * replacement) {
	assert(strlen(line));
	assert(strlen(target));
	assert(strlen(replacement));	
	assert(!*buffer);

	char * insert_pos;
	
	if (!(insert_pos = strstr(line, target))) {
		return 0;
	}

	int line_len = strlen(line);
	int replacement_len = strlen(replacement);
	int target_len = strlen(target);
	int new_size = line_len + replacement_len - target_len; 
	
	char * temp_buffer = malloc(sizeof(char) * (new_size+1));

	char * re_pos_in_new = strstr(strcpy(temp_buffer, line), target);
	char * final_pos_in_new = strcpy(re_pos_in_new ,replacement) + replacement_len;
	strcpy(final_pos_in_new, insert_pos + target_len); 
	
	assert(strlen(temp_buffer));
	assert(strlen(temp_buffer) == new_size);

	*buffer = temp_buffer;
	return 1;
	
}

#if TEST 
int test_find () {
	return find("BOING", "B") * find("BOING", "O") * find("BOING", "G") * find("BOING", "G") * (1 + find("BOING","OINGO") * (1+(find("A","AAAAA"))));
}

void test_replace() {
	//case 1 - simple 
	char * new = NULL;
	int ok = replace(&new, "This is a line", "a", "the");
	assert(ok);
	assert(strlen(new));
	assert(strcmp(new, "This is the line") == 0);
	free(new);
	
	//case 2 - first  
	new = NULL;
	ok = replace(&new, "This is a line", "This is", "I am");
	assert(ok);
	assert(strlen(new));
	assert(strcmp(new, "I am a line") == 0);
	free(new);
	
	//case 3 - last 
	new = NULL;
	ok = replace(&new, "This is a line", "line", "lot");
	assert(ok);
	assert(strlen(new));
	assert(strcmp(new, "This is a lot") == 0);
	free(new);
	
	//case 4 - none 
	new = NULL;
	ok = replace(&new, "This is a line", "binky", "lot");
	assert(ok == 0);
	assert(new == NULL);

}

void test () {
	assert(test_find());
	test_replace();
}
#endif 














