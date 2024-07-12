	.arch armv8-a
	.file	"main.c"
	.text
	.global	first_line .bss
	.align	3
	.type	first_line, %object
	.size	first_line, 8
first_line:
	.zero	8
	.global	current_line
	.align	3
	.type	current_line, %object
	.size	current_line, 8
current_line:
	.zero	8
	.global	fd
	.align	3
	.type	fd, %object
	.size	fd, 8
fd:
	.zero	8
	.text
	.align	2
	.global	make_line
	.type	make_line, %function
make_line:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	str	w1, [sp, 20]
	str	w2, [sp, 16]
	mov	x0, 24
	bl	malloc
	str	x0, [sp, 40]
	ldr	w0, [sp, 20]
	add	w0, w0, 1
	sxtw	x0, w0
	bl	malloc
	mov	x1, x0
	ldr	x0, [sp, 40]
	str	x1, [x0]
	ldr	x0, [sp, 40]
	ldr	x0, [x0]
	ldrsw	x1, [sp, 20]
	mov	x2, x1
	ldr	x1, [sp, 24]
	bl	strncpy
	ldr	x0, [sp, 40]
	ldr	x1, [x0]
	ldrsw	x0, [sp, 20]
	add	x0, x1, x0
	strb	wzr, [x0]
	ldr	x0, [sp, 40]
	ldr	w1, [sp, 16]
	str	w1, [x0, 8]
	ldr	x0, [sp, 40]
	ldr	w1, [sp, 20]
	str	w1, [x0, 12]
	ldr	x0, [sp, 40]
	str	xzr, [x0, 16]
	ldr	x0, [sp, 40]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	make_line, .-make_line
	.align	2
	.global	new_blank_line
	.type	new_blank_line, %function
new_blank_line:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	mov	x0, 24
	bl	malloc
	str	x0, [sp, 24]
	mov	x0, 1
	bl	malloc
	mov	x1, x0
	ldr	x0, [sp, 24]
	str	x1, [x0]
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	strb	wzr, [x0]
	ldr	x0, [sp, 24]
	mov	w1, 1
	str	w1, [x0, 8]
	ldr	x0, [sp, 24]
	str	wzr, [x0, 12]
	ldr	x0, [sp, 24]
	str	xzr, [x0, 16]
	ldr	x0, [sp, 24]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	new_blank_line, .-new_blank_line
	.section	.rodata
	.align	3
.LC0:
	.string	"%d: %s"
	.text
	.align	2
	.global	printLine
	.type	printLine, %function
printLine:
.LFB8:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldr	w1, [x0, 8]
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	mov	x2, x0
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
	ldr	x0, [sp, 24]
	ldr	x0, [x0, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	printLine, .-printLine
	.align	2
	.global	print_doc
	.type	print_doc, %function
print_doc:
.LFB9:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	str	x0, [sp, 40]
	b	.L8
.L9:
	ldr	x0, [sp, 40]
	bl	printLine
	str	x0, [sp, 40]
.L8:
	ldr	x0, [sp, 40]
	cmp	x0, 0
	bne	.L9
	nop
	nop
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE9:
	.size	print_doc, .-print_doc
	.section	.rodata
	.align	3
.LC1:
	.string	"%d: "
	.align	3
.LC2:
	.string	"%d> "
	.text
	.align	2
	.global	print_prompt
	.type	print_prompt, %function
print_prompt:
.LFB10:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 0
	bne	.L11
	adrp	x0, current_line
	add	x0, x0, :lo12:current_line
	ldr	x0, [x0]
	ldr	w0, [x0, 8]
	mov	w1, w0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printf
	b	.L13
.L11:
	adrp	x0, current_line
	add	x0, x0, :lo12:current_line
	ldr	x0, [x0]
	ldr	w0, [x0, 8]
	mov	w1, w0
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	printf
.L13:
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE10:
	.size	print_prompt, .-print_prompt
	.section	.rodata
	.align	3
.LC3:
	.string	"Bad mode detected."
	.text
	.align	2
	.global	run_input
	.type	run_input, %function
run_input:
.LFB11:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	str	x1, [sp, 16]
	str	w2, [sp, 24]
	ldr	w0, [sp, 28]
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 0
	beq	.L15
	ldr	w0, [sp, 28]
	cmp	w0, 1
	beq	.L16
	b	.L20
.L15:
	add	x0, sp, 44
	mov	x2, x0
	ldr	w1, [sp, 24]
	ldr	x0, [sp, 16]
	bl	run_comand
	b	.L18
.L16:
	adrp	x0, current_line
	add	x0, x0, :lo12:current_line
	ldr	x0, [x0]
	ldr	x1, [sp, 16]
	bl	add_text_to_node
	str	wzr, [sp, 44]
	b	.L18
.L20:
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	puts
	mov	w0, 0
	bl	exit
.L18:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE11:
	.size	run_input, .-run_input
	.section	.rodata
	.align	3
.LC4:
	.string	"Error. Input buffer overflow. Line discarded."
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB12:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	w0, [sp, 28]
	str	x1, [sp, 16]
	ldr	x1, [sp, 16]
	ldr	w0, [sp, 28]
	bl	initialize
	str	wzr, [sp, 60]
	adrp	x0, current_line
	add	x0, x0, :lo12:current_line
	ldr	x0, [x0]
	ldr	w0, [x0, 8]
	mov	w1, w0
	adrp	x0, .LC1
	add	x0, x0, :lo12:.LC1
	bl	printf
.L23:
	adrp	x0, stdin
	add	x0, x0, :lo12:stdin
	ldr	x2, [x0]
	add	x1, sp, 32
	add	x0, sp, 40
	bl	getline
	str	x0, [sp, 48]
	ldr	x0, [sp, 48]
	cmp	x0, 512
	bls	.L22
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	puts
	mov	w0, 0
	bl	exit
.L22:
	ldr	x0, [sp, 40]
	ldr	x1, [sp, 48]
	add	w1, w1, 1
	mov	w2, w1
	mov	x1, x0
	ldr	w0, [sp, 60]
	bl	run_input
	str	w0, [sp, 60]
	ldr	w0, [sp, 60]
	bl	print_prompt
	b	.L23
	.cfi_endproc
.LFE12:
	.size	main, .-main
	.align	2
	.global	is_in_string
	.type	is_in_string, %function
is_in_string:
.LFB13:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -48
	str	x0, [sp, 40]
	strb	w1, [sp, 39]
	str	wzr, [sp, 60]
	b	.L25
.L28:
	ldrsw	x0, [sp, 60]
	ldr	x1, [sp, 40]
	add	x0, x1, x0
	ldrb	w0, [x0]
	ldrb	w1, [sp, 39]
	cmp	w1, w0
	bne	.L26
	mov	w0, 1
	b	.L27
.L26:
	ldr	x0, [sp, 40]
	add	x0, x0, 1
	str	x0, [sp, 40]
.L25:
	ldrsw	x19, [sp, 60]
	ldr	x0, [sp, 40]
	bl	strlen
	cmp	x19, x0
	bcc	.L28
	mov	w0, 0
.L27:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE13:
	.size	is_in_string, .-is_in_string
	.align	2
	.global	get_max_line_number
	.type	get_max_line_number, %function
get_max_line_number:
.LFB14:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 8]
	b	.L30
.L31:
	ldr	x0, [sp, 8]
	ldr	x0, [x0, 16]
	str	x0, [sp, 8]
.L30:
	ldr	x0, [sp, 8]
	ldr	x0, [x0, 16]
	cmp	x0, 0
	bne	.L31
	ldr	x0, [sp, 8]
	ldr	w0, [x0, 8]
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE14:
	.size	get_max_line_number, .-get_max_line_number
	.align	2
	.global	resolve_target
	.type	resolve_target, %function
resolve_target:
.LFB15:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	ldrb	w0, [x0]
	cmp	w0, 43
	beq	.L34
	cmp	w0, 43
	bgt	.L35
	cmp	w0, 36
	beq	.L36
	cmp	w0, 36
	bgt	.L35
	cmp	w0, 0
	beq	.L37
	cmp	w0, 32
	beq	.L38
	b	.L35
.L37:
	adrp	x0, current_line
	add	x0, x0, :lo12:current_line
	ldr	x0, [x0]
	ldr	w0, [x0, 8]
	b	.L39
.L34:
	adrp	x0, current_line
	add	x0, x0, :lo12:current_line
	ldr	x0, [x0]
	ldr	w0, [x0, 8]
	add	w0, w0, 1
	b	.L39
.L36:
	bl	get_max_line_number
	b	.L39
.L38:
	mov	w0, 1
	b	.L39
.L35:
	ldr	x0, [sp, 24]
	bl	atoi
	str	w0, [sp, 44]
	ldr	w0, [sp, 44]
.L39:
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE15:
	.size	resolve_target, .-resolve_target
	.section	.rodata
	.align	3
.LC5:
	.string	"Line error - first num is zero."
	.align	3
.LC6:
	.string	"Line error - second num is zero."
	.text
	.align	2
	.global	resolve_targets
	.type	resolve_targets, %function
resolve_targets:
.LFB16:
	.cfi_startproc
	stp	x29, x30, [sp, -240]!
	.cfi_def_cfa_offset 240
	.cfi_offset 29, -240
	.cfi_offset 30, -232
	mov	x29, sp
	.cfi_def_cfa_register 29
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	.cfi_offset 19, -224
	.cfi_offset 20, -216
	.cfi_offset 21, -208
	.cfi_offset 22, -200
	.cfi_offset 23, -192
	.cfi_offset 24, -184
	.cfi_offset 25, -176
	.cfi_offset 26, -168
	.cfi_offset 27, -160
	str	x0, [x29, 184]
	str	x1, [x29, 176]
	str	x2, [x29, 168]
	mov	x0, sp
	mov	x19, x0
	ldr	x0, [x29, 184]
	bl	strlen
	add	w0, w0, 1
	str	w0, [x29, 232]
	ldr	w0, [x29, 232]
	sxtw	x1, w0
	sub	x1, x1, #1
	str	x1, [x29, 224]
	sxtw	x1, w0
	str	x1, [x29, 144]
	str	xzr, [x29, 152]
	ldp	x2, x3, [x29, 144]
	mov	x1, x2
	lsr	x1, x1, 61
	mov	x4, x3
	lsl	x27, x4, 3
	orr	x27, x1, x27
	mov	x1, x2
	lsl	x26, x1, 3
	sxtw	x1, w0
	str	x1, [x29, 128]
	str	xzr, [x29, 136]
	ldp	x2, x3, [x29, 128]
	mov	x1, x2
	lsr	x1, x1, 61
	mov	x4, x3
	lsl	x25, x4, 3
	orr	x25, x1, x25
	mov	x1, x2
	lsl	x24, x1, 3
	sxtw	x0, w0
	add	x0, x0, 15
	lsr	x0, x0, 4
	lsl	x0, x0, 4
	sub	sp, sp, x0
	mov	x0, sp
	add	x0, x0, 0
	str	x0, [x29, 216]
	ldr	w0, [x29, 232]
	sxtw	x1, w0
	sub	x1, x1, #1
	str	x1, [x29, 208]
	sxtw	x1, w0
	str	x1, [x29, 112]
	str	xzr, [x29, 120]
	ldp	x2, x3, [x29, 112]
	mov	x1, x2
	lsr	x1, x1, 61
	mov	x4, x3
	lsl	x23, x4, 3
	orr	x23, x1, x23
	mov	x1, x2
	lsl	x22, x1, 3
	sxtw	x1, w0
	str	x1, [x29, 96]
	str	xzr, [x29, 104]
	ldp	x2, x3, [x29, 96]
	mov	x1, x2
	lsr	x1, x1, 61
	mov	x4, x3
	lsl	x21, x4, 3
	orr	x21, x1, x21
	mov	x1, x2
	lsl	x20, x1, 3
	sxtw	x0, w0
	add	x0, x0, 15
	lsr	x0, x0, 4
	lsl	x0, x0, 4
	sub	sp, sp, x0
	mov	x0, sp
	add	x0, x0, 0
	str	x0, [x29, 200]
	str	wzr, [x29, 236]
	str	wzr, [x29, 196]
	b	.L41
.L43:
	ldrsw	x0, [x29, 236]
	ldr	x1, [x29, 184]
	add	x0, x1, x0
	ldr	w2, [x29, 236]
	ldr	w1, [x29, 196]
	sub	w3, w2, w1
	ldrb	w2, [x0]
	ldr	x1, [x29, 216]
	sxtw	x0, w3
	strb	w2, [x1, x0]
	ldr	w0, [x29, 236]
	add	w0, w0, 1
	str	w0, [x29, 236]
.L41:
	ldrsw	x0, [x29, 236]
	ldr	x1, [x29, 184]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, 44
	beq	.L42
	ldrsw	x0, [x29, 236]
	ldr	x1, [x29, 184]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, 0
	bne	.L43
.L42:
	ldr	w1, [x29, 236]
	ldr	w0, [x29, 196]
	sub	w0, w1, w0
	ldr	x1, [x29, 216]
	sxtw	x0, w0
	strb	wzr, [x1, x0]
	ldrsw	x0, [x29, 236]
	ldr	x1, [x29, 184]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, 0
	beq	.L44
	ldr	w0, [x29, 236]
	add	w0, w0, 1
	str	w0, [x29, 236]
	ldr	w0, [x29, 236]
	str	w0, [x29, 196]
	b	.L45
.L47:
	ldrsw	x0, [x29, 236]
	ldr	x1, [x29, 184]
	add	x0, x1, x0
	ldr	w2, [x29, 236]
	ldr	w1, [x29, 196]
	sub	w3, w2, w1
	ldrb	w2, [x0]
	ldr	x1, [x29, 200]
	sxtw	x0, w3
	strb	w2, [x1, x0]
	ldr	w0, [x29, 236]
	add	w0, w0, 1
	str	w0, [x29, 236]
.L45:
	ldrsw	x0, [x29, 236]
	ldr	x1, [x29, 184]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, 44
	beq	.L46
	ldrsw	x0, [x29, 236]
	ldr	x1, [x29, 184]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, 0
	bne	.L47
.L46:
	ldr	w1, [x29, 236]
	ldr	w0, [x29, 196]
	sub	w0, w1, w0
	ldr	x1, [x29, 200]
	sxtw	x0, w0
	strb	wzr, [x1, x0]
	b	.L48
.L44:
	ldr	x0, [x29, 200]
	strb	wzr, [x0]
.L48:
	ldr	x0, [x29, 216]
	bl	resolve_target
	mov	w1, w0
	ldr	x0, [x29, 176]
	str	w1, [x0]
	ldr	x0, [x29, 200]
	bl	resolve_target
	mov	w1, w0
	ldr	x0, [x29, 168]
	str	w1, [x0]
	ldr	x0, [x29, 176]
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L49
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	printf
	mov	w0, 2
	b	.L50
.L49:
	ldr	x0, [x29, 168]
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L51
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	printf
	mov	w0, 2
	b	.L50
.L51:
	ldr	x0, [x29, 200]
	ldrb	w0, [x0]
	cmp	w0, 0
	bne	.L52
	mov	w0, 0
	b	.L50
.L52:
	mov	w0, 1
.L50:
	mov	sp, x19
	mov	sp, x29
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 240
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa 31, 0
	ret
	.cfi_endproc
.LFE16:
	.size	resolve_targets, .-resolve_targets
	.section	.rodata
	.align	3
.LC7:
	.string	"+-,$1234567890"
	.align	3
.LC8:
	.string	"Invalid line numbers. "
	.align	3
.LC9:
	.string	"Replace words:%s:%s.\n"
	.align	3
.LC10:
	.string	"Search:%s:%s.\n"
	.align	3
.LC11:
	.string	"Exiting."
	.align	3
.LC12:
	.string	"Invalid comand. "
	.text
	.align	2
	.global	run_comand
	.type	run_comand, %function
run_comand:
.LFB17:
	.cfi_startproc
	sub	sp, sp, #1104
	.cfi_def_cfa_offset 1104
	stp	x29, x30, [sp]
	.cfi_offset 29, -1104
	.cfi_offset 30, -1096
	mov	x29, sp
	str	x0, [sp, 40]
	str	w1, [sp, 36]
	str	x2, [sp, 24]
	b	.L55
.L56:
	ldr	x0, [sp, 40]
	add	x0, x0, 1
	str	x0, [sp, 40]
.L55:
	ldr	x0, [sp, 40]
	ldrb	w0, [x0]
	cmp	w0, 10
	beq	.L56
	str	wzr, [sp, 1100]
	str	wzr, [sp, 1096]
	b	.L57
.L59:
	ldrsw	x0, [sp, 1100]
	ldr	x1, [sp, 40]
	add	x0, x1, x0
	ldr	w2, [sp, 1100]
	ldr	w1, [sp, 1096]
	sub	w1, w2, w1
	ldrb	w2, [x0]
	sxtw	x0, w1
	add	x1, sp, 576
	strb	w2, [x1, x0]
	ldr	w0, [sp, 1100]
	add	w0, w0, 1
	str	w0, [sp, 1100]
.L57:
	ldrsw	x0, [sp, 1100]
	ldr	x1, [sp, 40]
	add	x0, x1, x0
	ldrb	w0, [x0]
	mov	w1, w0
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	is_in_string
	cmp	w0, 1
	bne	.L58
	ldrsw	x0, [sp, 1100]
	ldr	x1, [sp, 40]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, 0
	bne	.L59
.L58:
	ldr	w1, [sp, 1100]
	ldr	w0, [sp, 1096]
	sub	w0, w1, w0
	sxtw	x0, w0
	add	x1, sp, 576
	strb	wzr, [x1, x0]
	ldr	w0, [sp, 1100]
	str	w0, [sp, 1096]
	b	.L60
.L61:
	ldrsw	x0, [sp, 1100]
	ldr	x1, [sp, 40]
	add	x0, x1, x0
	ldr	w2, [sp, 1100]
	ldr	w1, [sp, 1096]
	sub	w1, w2, w1
	ldrb	w2, [x0]
	sxtw	x0, w1
	add	x1, sp, 64
	strb	w2, [x1, x0]
	ldr	w0, [sp, 1100]
	add	w0, w0, 1
	str	w0, [sp, 1100]
.L60:
	ldrsw	x0, [sp, 1100]
	ldr	x1, [sp, 40]
	add	x0, x1, x0
	ldrb	w0, [x0]
	cmp	w0, 0
	bne	.L61
	ldr	w1, [sp, 1100]
	ldr	w0, [sp, 1096]
	sub	w0, w1, w0
	sxtw	x0, w0
	add	x1, sp, 64
	strb	wzr, [x1, x0]
	str	wzr, [sp, 60]
	str	wzr, [sp, 56]
	add	x2, sp, 56
	add	x1, sp, 60
	add	x0, sp, 576
	bl	resolve_targets
	str	w0, [sp, 1092]
	ldr	w0, [sp, 1092]
	cmp	w0, 0
	beq	.L62
	ldr	w0, [sp, 1092]
	cmp	w0, 1
	beq	.L62
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	bl	puts
	mov	w0, 0
	b	.L54
.L62:
	ldrb	w0, [sp, 64]
	sub	w0, w0, #97
	cmp	w0, 22
	bhi	.L64
	adrp	x1, .L66
	add	x1, x1, :lo12:.L66
	ldr	w0, [x1,w0,uxtw #2]
	adr	x1, .Lrtx66
	add	x0, x1, w0, sxtw #2
	br	x0
.Lrtx66:
	.section	.rodata
	.align	0
	.align	2
.L66:
	.word	(.L77 - .Lrtx66) / 4
	.word	(.L64 - .Lrtx66) / 4
	.word	(.L76 - .Lrtx66) / 4
	.word	(.L75 - .Lrtx66) / 4
	.word	(.L64 - .Lrtx66) / 4
	.word	(.L64 - .Lrtx66) / 4
	.word	(.L74 - .Lrtx66) / 4
	.word	(.L64 - .Lrtx66) / 4
	.word	(.L64 - .Lrtx66) / 4
	.word	(.L64 - .Lrtx66) / 4
	.word	(.L64 - .Lrtx66) / 4
	.word	(.L64 - .Lrtx66) / 4
	.word	(.L73 - .Lrtx66) / 4
	.word	(.L72 - .Lrtx66) / 4
	.word	(.L71 - .Lrtx66) / 4
	.word	(.L70 - .Lrtx66) / 4
	.word	(.L69 - .Lrtx66) / 4
	.word	(.L68 - .Lrtx66) / 4
	.word	(.L67 - .Lrtx66) / 4
	.word	(.L64 - .Lrtx66) / 4
	.word	(.L64 - .Lrtx66) / 4
	.word	(.L64 - .Lrtx66) / 4
	.word	(.L65 - .Lrtx66) / 4
	.text
.L65:
	bl	write
	b	.L78
.L75:
	ldr	w0, [sp, 60]
	ldr	w1, [sp, 56]
	bl	delete
	ldr	x0, [sp, 24]
	str	wzr, [x0]
	b	.L78
.L68:
	ldr	w0, [sp, 60]
	bl	replace
	ldr	x0, [sp, 24]
	mov	w1, 1
	str	w1, [x0]
	b	.L78
.L77:
	ldr	w0, [sp, 60]
	bl	append
	ldr	x0, [sp, 24]
	mov	w1, 1
	str	w1, [x0]
	b	.L78
.L71:
	ldr	w0, [sp, 60]
	bl	prepend
	ldr	x0, [sp, 24]
	mov	w1, 1
	str	w1, [x0]
	b	.L78
.L67:
	add	x1, sp, 64
	add	x0, sp, 576
	mov	x2, x1
	mov	x1, x0
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	printf
	bl	replace_words
	b	.L78
.L74:
	add	x1, sp, 64
	add	x0, sp, 576
	mov	x2, x1
	mov	x1, x0
	adrp	x0, .LC10
	add	x0, x0, :lo12:.LC10
	bl	printf
	bl	search
	b	.L78
.L70:
	ldr	w0, [sp, 60]
	ldr	w1, [sp, 56]
	bl	print
	b	.L78
.L73:
	ldr	w0, [sp, 60]
	ldr	w1, [sp, 56]
	bl	move
	b	.L78
.L76:
	ldr	w0, [sp, 60]
	ldr	w1, [sp, 56]
	bl	copy
	ldr	x0, [sp, 24]
	str	wzr, [x0]
	b	.L78
.L72:
	ldr	w0, [sp, 60]
	ldr	w1, [sp, 56]
	bl	numbers
	b	.L78
.L69:
	adrp	x0, .LC11
	add	x0, x0, :lo12:.LC11
	bl	puts
	mov	w0, 0
	bl	exit
.L64:
	adrp	x0, .LC12
	add	x0, x0, :lo12:.LC12
	bl	puts
	nop
.L78:
.L54:
	ldp	x29, x30, [sp]
	add	sp, sp, 1104
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE17:
	.size	run_comand, .-run_comand
	.align	2
	.global	print
	.type	print, %function
print:
.LFB18:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	str	w1, [sp, 24]
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 40]
	str	wzr, [sp, 36]
	b	.L81
.L85:
	ldr	x0, [sp, 40]
	ldr	w0, [x0, 8]
	str	w0, [sp, 36]
	ldr	w1, [sp, 36]
	ldr	w0, [sp, 28]
	cmp	w1, w0
	blt	.L82
	ldr	w1, [sp, 36]
	ldr	w0, [sp, 24]
	cmp	w1, w0
	bgt	.L87
	ldr	x0, [sp, 40]
	ldr	x0, [x0]
	mov	x2, x0
	ldr	w1, [sp, 36]
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	printf
.L82:
	ldr	x0, [sp, 40]
	ldr	x0, [x0, 16]
	str	x0, [sp, 40]
.L81:
	ldr	x0, [sp, 40]
	cmp	x0, 0
	bne	.L85
	b	.L84
.L87:
	nop
.L84:
	mov	w0, 1
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE18:
	.size	print, .-print
	.section	.rodata
	.align	3
.LC13:
	.string	"%d lines. %d characters.\n"
	.text
	.align	2
	.global	numbers
	.type	numbers, %function
numbers:
.LFB19:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	w0, [sp, 28]
	str	w1, [sp, 24]
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 56]
	str	wzr, [sp, 52]
	str	wzr, [sp, 48]
	str	wzr, [sp, 44]
	b	.L89
.L94:
	ldr	w0, [sp, 52]
	cmp	w0, 0
	beq	.L90
	mov	w0, 10
	bl	putchar
.L90:
	ldr	x0, [sp, 56]
	ldr	w0, [x0, 8]
	str	w0, [sp, 52]
	ldr	w1, [sp, 52]
	ldr	w0, [sp, 28]
	cmp	w1, w0
	blt	.L91
	ldr	w1, [sp, 52]
	ldr	w0, [sp, 24]
	cmp	w1, w0
	bgt	.L96
	ldr	w0, [sp, 48]
	add	w0, w0, 1
	str	w0, [sp, 48]
	ldr	x0, [sp, 56]
	ldr	w0, [x0, 12]
	ldr	w1, [sp, 44]
	add	w0, w1, w0
	str	w0, [sp, 44]
.L91:
	ldr	x0, [sp, 56]
	ldr	x0, [x0, 16]
	str	x0, [sp, 56]
.L89:
	ldr	x0, [sp, 56]
	cmp	x0, 0
	bne	.L94
	b	.L93
.L96:
	nop
.L93:
	ldr	w2, [sp, 44]
	ldr	w1, [sp, 48]
	adrp	x0, .LC13
	add	x0, x0, :lo12:.LC13
	bl	printf
	mov	w0, 1
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE19:
	.size	numbers, .-numbers
	.align	2
	.global	replace
	.type	replace, %function
replace:
.LFB20:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 40]
	b	.L98
.L101:
	ldr	x0, [sp, 40]
	ldr	w0, [x0, 8]
	ldr	w1, [sp, 28]
	cmp	w1, w0
	beq	.L103
	ldr	x0, [sp, 40]
	ldr	x0, [x0, 16]
	str	x0, [sp, 40]
.L98:
	ldr	x0, [sp, 40]
	cmp	x0, 0
	bne	.L101
	b	.L100
.L103:
	nop
.L100:
	ldr	x0, [sp, 40]
	ldr	x0, [x0]
	bl	free
	mov	x0, 2
	bl	malloc
	mov	x1, x0
	ldr	x0, [sp, 40]
	str	x1, [x0]
	ldr	x0, [sp, 40]
	ldr	x0, [x0]
	mov	w1, 10
	strb	w1, [x0]
	ldr	x0, [sp, 40]
	ldr	x0, [x0]
	add	x0, x0, 1
	strb	wzr, [x0]
	ldr	x0, [sp, 40]
	mov	w1, 1
	str	w1, [x0, 12]
	adrp	x0, current_line
	add	x0, x0, :lo12:current_line
	ldr	x1, [sp, 40]
	str	x1, [x0]
	mov	w0, 1
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE20:
	.size	replace, .-replace
	.align	2
	.global	delete
	.type	delete, %function
delete:
.LFB21:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	str	w0, [sp, 28]
	str	w1, [sp, 24]
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 72]
	b	.L105
.L106:
	ldr	x0, [sp, 72]
	ldr	x0, [x0, 16]
	str	x0, [sp, 72]
.L105:
	ldr	x0, [sp, 72]
	ldr	x0, [x0, 16]
	cmp	x0, 0
	bne	.L106
	ldr	w0, [sp, 28]
	str	w0, [sp, 60]
	ldr	x0, [sp, 72]
	ldr	w0, [x0, 8]
	ldr	w1, [sp, 24]
	cmp	w1, w0
	cset	w0, ge
	and	w0, w0, 255
	str	w0, [sp, 56]
	ldr	w0, [sp, 60]
	cmp	w0, 1
	bne	.L107
	ldr	w0, [sp, 56]
	cmp	w0, 1
	bne	.L107
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 72]
	b	.L108
.L109:
	ldr	x0, [sp, 72]
	str	x0, [sp, 48]
	ldr	x0, [sp, 72]
	ldr	x0, [x0, 16]
	str	x0, [sp, 72]
	ldr	x0, [sp, 48]
	ldr	x0, [x0]
	bl	free
	ldr	x0, [sp, 48]
	bl	free
.L108:
	ldr	x0, [sp, 72]
	cmp	x0, 0
	bne	.L109
	bl	new_blank_line
	mov	x1, x0
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	str	x1, [x0]
	bl	new_blank_line
	mov	x1, x0
	adrp	x0, current_line
	add	x0, x0, :lo12:current_line
	str	x1, [x0]
	b	.L110
.L107:
	ldr	w0, [sp, 60]
	cmp	w0, 1
	bne	.L111
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 72]
	b	.L112
.L114:
	ldr	x0, [sp, 72]
	str	x0, [sp, 32]
	ldr	x0, [sp, 72]
	ldr	x0, [x0, 16]
	str	x0, [sp, 72]
	ldr	x0, [sp, 32]
	ldr	x0, [x0]
	bl	free
	ldr	x0, [sp, 32]
	bl	free
.L112:
	ldr	x0, [sp, 72]
	cmp	x0, 0
	beq	.L113
	ldr	x0, [sp, 72]
	ldr	w0, [x0, 8]
	ldr	w1, [sp, 24]
	cmp	w1, w0
	bge	.L114
.L113:
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x1, [sp, 72]
	str	x1, [x0]
	adrp	x0, current_line
	add	x0, x0, :lo12:current_line
	ldr	x1, [sp, 72]
	str	x1, [x0]
	b	.L110
.L111:
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 72]
	b	.L115
.L118:
	ldr	x0, [sp, 72]
	ldr	x0, [x0, 16]
	ldr	w0, [x0, 8]
	ldr	w1, [sp, 28]
	cmp	w1, w0
	bne	.L116
	ldr	x0, [sp, 72]
	str	x0, [sp, 64]
	b	.L117
.L116:
	ldr	x0, [sp, 72]
	ldr	x0, [x0, 16]
	str	x0, [sp, 72]
.L115:
	ldr	x0, [sp, 72]
	ldr	x0, [x0, 16]
	cmp	x0, 0
	bne	.L118
.L117:
	b	.L119
.L121:
	ldr	x0, [sp, 64]
	ldr	x0, [x0, 16]
	ldr	x0, [x0, 16]
	cmp	x0, 0
	beq	.L120
	ldr	x0, [sp, 64]
	ldr	x0, [x0, 16]
	str	x0, [sp, 40]
	ldr	x0, [sp, 40]
	ldr	x1, [x0, 16]
	ldr	x0, [sp, 64]
	str	x1, [x0, 16]
	ldr	x0, [sp, 40]
	ldr	x0, [x0]
	bl	free
	ldr	x0, [sp, 40]
	bl	free
	b	.L119
.L120:
	ldr	x0, [sp, 64]
	str	xzr, [x0, 16]
	b	.L110
.L119:
	ldr	x0, [sp, 64]
	ldr	x0, [x0, 16]
	ldr	w0, [x0, 8]
	ldr	w1, [sp, 24]
	cmp	w1, w0
	bge	.L121
.L110:
	bl	fix_line_numbers
	mov	w0, 1
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE21:
	.size	delete, .-delete
	.align	2
	.global	move
	.type	move, %function
move:
.LFB22:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	str	w0, [sp, 28]
	str	w1, [sp, 24]
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 72]
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 64]
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 56]
	bl	new_node
	str	x0, [sp, 40]
	ldr	w0, [sp, 24]
	cmp	w0, 1
	bne	.L129
	b	.L125
.L127:
	ldr	x0, [sp, 72]
	ldr	w0, [x0, 8]
	ldr	w1, [sp, 28]
	cmp	w1, w0
	bne	.L126
	ldr	x0, [sp, 72]
	str	x0, [sp, 56]
.L126:
	ldr	x0, [sp, 72]
	ldr	x0, [x0, 16]
	str	x0, [sp, 72]
.L125:
	ldr	x0, [sp, 72]
	cmp	x0, 0
	bne	.L127
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	ldr	x1, [sp, 40]
	bl	move_lines
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x1, [x0]
	adrp	x0, current_line
	add	x0, x0, :lo12:current_line
	str	x1, [x0]
	b	.L128
.L132:
	ldr	x0, [sp, 72]
	ldr	w1, [x0, 8]
	ldr	w0, [sp, 24]
	sub	w0, w0, #1
	cmp	w1, w0
	bne	.L130
	ldr	x0, [sp, 72]
	str	x0, [sp, 64]
.L130:
	ldr	x0, [sp, 72]
	ldr	w0, [x0, 8]
	ldr	w1, [sp, 28]
	cmp	w1, w0
	bne	.L131
	ldr	x0, [sp, 72]
	str	x0, [sp, 56]
.L131:
	ldr	x0, [sp, 72]
	ldr	x0, [x0, 16]
	str	x0, [sp, 72]
.L129:
	ldr	x0, [sp, 72]
	cmp	x0, 0
	bne	.L132
	ldr	x0, [sp, 64]
	ldr	x1, [x0, 16]
	ldr	x0, [sp, 40]
	str	x1, [x0, 16]
	ldr	x0, [sp, 64]
	ldr	x1, [sp, 40]
	str	x1, [x0, 16]
	adrp	x0, current_line
	add	x0, x0, :lo12:current_line
	ldr	x1, [sp, 40]
	str	x1, [x0]
.L128:
	adrp	x0, current_line
	add	x0, x0, :lo12:current_line
	ldr	x0, [x0]
	mov	x1, x0
	ldr	x0, [sp, 56]
	bl	copy_to_node
	ldr	x0, [sp, 56]
	ldr	w1, [x0, 8]
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	ldr	w0, [x0, 8]
	cmp	w1, w0
	bne	.L133
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	ldr	x0, [x0, 16]
	str	x0, [sp, 48]
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	ldr	x2, [x0, 16]
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	mov	x1, x0
	mov	x0, x2
	bl	move_lines
	b	.L134
.L133:
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 72]
	b	.L135
.L138:
	ldr	x0, [sp, 72]
	ldr	x0, [x0, 16]
	ldr	x1, [sp, 56]
	cmp	x1, x0
	beq	.L141
	ldr	x0, [sp, 72]
	ldr	x0, [x0, 16]
	str	x0, [sp, 72]
.L135:
	ldr	x0, [sp, 72]
	ldr	x0, [x0, 16]
	cmp	x0, 0
	bne	.L138
	b	.L137
.L141:
	nop
.L137:
	ldr	x0, [sp, 72]
	ldr	x0, [x0, 16]
	str	x0, [sp, 48]
	ldr	x0, [sp, 48]
	ldr	x0, [x0, 16]
	cmp	x0, 0
	beq	.L139
	ldr	x0, [sp, 48]
	ldr	x1, [x0, 16]
	ldr	x0, [sp, 72]
	str	x1, [x0, 16]
	b	.L134
.L139:
	ldr	x0, [sp, 72]
	str	xzr, [x0, 16]
.L134:
	ldr	x0, [sp, 48]
	ldr	x0, [x0]
	bl	free
	ldr	x0, [sp, 48]
	bl	free
	bl	fix_line_numbers
	mov	w0, 1
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE22:
	.size	move, .-move
	.align	2
	.global	copy_to_node
	.type	copy_to_node, %function
copy_to_node:
.LFB23:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x0, [sp, 16]
	ldr	x0, [x0]
	bl	free
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	bl	strlen
	str	w0, [sp, 44]
	ldr	w0, [sp, 44]
	add	w0, w0, 1
	sxtw	x0, w0
	bl	malloc
	mov	x1, x0
	ldr	x0, [sp, 16]
	str	x1, [x0]
	ldr	x0, [sp, 16]
	ldr	x2, [x0]
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	mov	x1, x0
	mov	x0, x2
	bl	strcpy
	ldr	x0, [sp, 16]
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	add	x0, x1, x0
	strb	wzr, [x0]
	ldr	x0, [sp, 24]
	ldr	w1, [x0, 12]
	ldr	x0, [sp, 16]
	str	w1, [x0, 12]
	nop
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE23:
	.size	copy_to_node, .-copy_to_node
	.align	2
	.global	copy
	.type	copy, %function
copy:
.LFB24:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	w0, [sp, 28]
	str	w1, [sp, 24]
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 56]
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 48]
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 40]
	bl	new_node
	str	x0, [sp, 32]
	ldr	w0, [sp, 24]
	cmp	w0, 1
	bne	.L149
	b	.L145
.L147:
	ldr	x0, [sp, 56]
	ldr	w0, [x0, 8]
	ldr	w1, [sp, 28]
	cmp	w1, w0
	bne	.L146
	ldr	x0, [sp, 56]
	str	x0, [sp, 40]
.L146:
	ldr	x0, [sp, 56]
	ldr	x0, [x0, 16]
	str	x0, [sp, 56]
.L145:
	ldr	x0, [sp, 56]
	cmp	x0, 0
	bne	.L147
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	ldr	x1, [sp, 32]
	bl	move_lines
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x1, [x0]
	adrp	x0, current_line
	add	x0, x0, :lo12:current_line
	str	x1, [x0]
	b	.L148
.L152:
	ldr	x0, [sp, 56]
	ldr	w1, [x0, 8]
	ldr	w0, [sp, 24]
	sub	w0, w0, #1
	cmp	w1, w0
	bne	.L150
	ldr	x0, [sp, 56]
	str	x0, [sp, 48]
.L150:
	ldr	x0, [sp, 56]
	ldr	w0, [x0, 8]
	ldr	w1, [sp, 28]
	cmp	w1, w0
	bne	.L151
	ldr	x0, [sp, 56]
	str	x0, [sp, 40]
.L151:
	ldr	x0, [sp, 56]
	ldr	x0, [x0, 16]
	str	x0, [sp, 56]
.L149:
	ldr	x0, [sp, 56]
	cmp	x0, 0
	bne	.L152
	ldr	x0, [sp, 48]
	ldr	x1, [x0, 16]
	ldr	x0, [sp, 32]
	str	x1, [x0, 16]
	ldr	x0, [sp, 48]
	ldr	x1, [sp, 32]
	str	x1, [x0, 16]
	adrp	x0, current_line
	add	x0, x0, :lo12:current_line
	ldr	x1, [sp, 32]
	str	x1, [x0]
.L148:
	adrp	x0, current_line
	add	x0, x0, :lo12:current_line
	ldr	x0, [x0]
	mov	x1, x0
	ldr	x0, [sp, 40]
	bl	copy_to_node
	bl	fix_line_numbers
	mov	w0, 1
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE24:
	.size	copy, .-copy
	.section	.rodata
	.align	3
.LC14:
	.string	"w"
	.align	3
.LC15:
	.string	"Writing to file %s.\n"
	.align	3
.LC16:
	.string	"Error writing to file %s.\n"
	.text
	.align	2
	.global	write
	.type	write, %function
write:
.LFB25:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	mov	x0, 0
	bl	filename_handler
	str	x0, [sp, 16]
	adrp	x0, .LC14
	add	x1, x0, :lo12:.LC14
	ldr	x0, [sp, 16]
	bl	fopen
	mov	x1, x0
	adrp	x0, fd
	add	x0, x0, :lo12:fd
	str	x1, [x0]
	adrp	x0, fd
	add	x0, x0, :lo12:fd
	ldr	x0, [x0]
	cmp	x0, 0
	beq	.L155
	ldr	x1, [sp, 16]
	adrp	x0, .LC15
	add	x0, x0, :lo12:.LC15
	bl	printf
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 24]
	b	.L158
.L155:
	ldr	x1, [sp, 16]
	adrp	x0, .LC16
	add	x0, x0, :lo12:.LC16
	bl	printf
	mov	w0, 0
	b	.L154
.L159:
	ldr	x0, [sp, 24]
	ldr	x4, [x0]
	ldr	x0, [sp, 24]
	ldr	w0, [x0, 12]
	sxtw	x1, w0
	adrp	x0, fd
	add	x0, x0, :lo12:fd
	ldr	x0, [x0]
	mov	x3, x0
	mov	x2, 1
	mov	x0, x4
	bl	fwrite
	ldr	x0, [sp, 24]
	ldr	x0, [x0, 16]
	str	x0, [sp, 24]
.L158:
	ldr	x0, [sp, 24]
	cmp	x0, 0
	bne	.L159
	adrp	x0, fd
	add	x0, x0, :lo12:fd
	ldr	x0, [x0]
	bl	fclose
.L154:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE25:
	.size	write, .-write
	.align	2
	.global	filename_handler
	.type	filename_handler, %function
filename_handler:
.LFB26:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	cmp	x0, 0
	beq	.L161
	ldr	x0, [sp, 24]
	bl	strlen
	add	x0, x0, 1
	bl	malloc
	mov	x1, x0
	adrp	x0, fileName.0
	add	x0, x0, :lo12:fileName.0
	str	x1, [x0]
	adrp	x0, fileName.0
	add	x0, x0, :lo12:fileName.0
	ldr	x0, [x0]
	ldr	x1, [sp, 24]
	bl	strcpy
	ldr	x0, [sp, 24]
	b	.L162
.L161:
	adrp	x0, fileName.0
	add	x0, x0, :lo12:fileName.0
	ldr	x0, [x0]
	str	x0, [sp, 24]
	adrp	x0, fileName.0
	add	x0, x0, :lo12:fileName.0
	ldr	x0, [x0]
.L162:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE26:
	.size	filename_handler, .-filename_handler
	.align	2
	.global	get_last_line
	.type	get_last_line, %function
get_last_line:
.LFB27:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 8]
	b	.L164
.L165:
	ldr	x0, [sp, 8]
	ldr	x0, [x0, 16]
	str	x0, [sp, 8]
.L164:
	ldr	x0, [sp, 8]
	ldr	x0, [x0, 16]
	cmp	x0, 0
	bne	.L165
	ldr	x0, [sp, 8]
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE27:
	.size	get_last_line, .-get_last_line
	.align	2
	.global	fix_line_numbers
	.type	fix_line_numbers, %function
fix_line_numbers:
.LFB28:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 8]
	mov	w0, 1
	str	w0, [sp, 4]
	b	.L168
.L169:
	ldr	x0, [sp, 8]
	ldr	w1, [sp, 4]
	str	w1, [x0, 8]
	ldr	w0, [sp, 4]
	add	w0, w0, 1
	str	w0, [sp, 4]
	ldr	x0, [sp, 8]
	ldr	x0, [x0, 16]
	str	x0, [sp, 8]
.L168:
	ldr	x0, [sp, 8]
	cmp	x0, 0
	bne	.L169
	nop
	nop
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE28:
	.size	fix_line_numbers, .-fix_line_numbers
	.align	2
	.global	new_node
	.type	new_node, %function
new_node:
.LFB29:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	mov	x0, 24
	bl	malloc
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	str	xzr, [x0, 16]
	ldr	x0, [sp, 24]
	str	wzr, [x0, 8]
	ldr	x0, [sp, 24]
	str	wzr, [x0, 12]
	ldr	x0, [sp, 24]
	str	xzr, [x0]
	ldr	x0, [sp, 24]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE29:
	.size	new_node, .-new_node
	.align	2
	.global	add_text_to_node
	.type	add_text_to_node, %function
add_text_to_node:
.LFB30:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x0, [sp, 24]
	str	x1, [sp, 16]
	ldr	x0, [sp, 16]
	bl	strlen
	add	x0, x0, 1
	bl	malloc
	mov	x1, x0
	ldr	x0, [sp, 24]
	str	x1, [x0]
	ldr	x0, [sp, 24]
	ldr	x0, [x0]
	ldr	x1, [sp, 16]
	bl	strcpy
	ldr	x0, [sp, 16]
	bl	strlen
	mov	w1, w0
	ldr	x0, [sp, 24]
	str	w1, [x0, 12]
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE30:
	.size	add_text_to_node, .-add_text_to_node
	.align	2
	.global	append
	.type	append, %function
append:
.LFB31:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	w0, [sp, 28]
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 56]
	b	.L174
.L177:
	ldr	x0, [sp, 56]
	ldr	w0, [x0, 8]
	ldr	w1, [sp, 28]
	cmp	w1, w0
	bne	.L175
	ldr	x0, [sp, 56]
	str	x0, [sp, 48]
	b	.L176
.L175:
	ldr	x0, [sp, 56]
	ldr	x0, [x0, 16]
	str	x0, [sp, 56]
.L174:
	ldr	x0, [sp, 56]
	cmp	x0, 0
	bne	.L177
.L176:
	ldr	x0, [sp, 56]
	cmp	x0, 0
	bne	.L178
	bl	get_last_line
	str	x0, [sp, 48]
.L178:
	bl	new_node
	str	x0, [sp, 40]
	adrp	x0, current_line
	add	x0, x0, :lo12:current_line
	ldr	x1, [sp, 40]
	str	x1, [x0]
	ldr	x0, [sp, 48]
	ldr	x0, [x0, 16]
	cmp	x0, 0
	beq	.L179
	ldr	x0, [sp, 48]
	ldr	x1, [x0, 16]
	ldr	x0, [sp, 40]
	str	x1, [x0, 16]
	ldr	x0, [sp, 48]
	ldr	x1, [sp, 40]
	str	x1, [x0, 16]
	b	.L180
.L179:
	ldr	x0, [sp, 48]
	ldr	x1, [sp, 40]
	str	x1, [x0, 16]
.L180:
	bl	fix_line_numbers
	mov	w0, 1
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE31:
	.size	append, .-append
	.align	2
	.global	move_lines
	.type	move_lines, %function
move_lines:
.LFB32:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	x0, [sp, 8]
	str	x1, [sp]
	ldr	x0, [sp, 8]
	ldr	x1, [x0, 16]
	ldr	x0, [sp]
	str	x1, [x0, 16]
	ldr	x0, [sp, 8]
	ldr	w1, [x0, 8]
	ldr	x0, [sp]
	str	w1, [x0, 8]
	ldr	x0, [sp, 8]
	ldr	x1, [x0]
	ldr	x0, [sp]
	str	x1, [x0]
	ldr	x0, [sp, 8]
	ldr	w1, [x0, 12]
	ldr	x0, [sp]
	str	w1, [x0, 12]
	ldr	x0, [sp, 8]
	ldr	x1, [sp]
	str	x1, [x0, 16]
	ldr	x0, [sp, 8]
	mov	w1, 1
	str	w1, [x0, 8]
	ldr	x0, [sp, 8]
	str	xzr, [x0]
	ldr	x0, [sp, 8]
	str	wzr, [x0, 12]
	nop
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE32:
	.size	move_lines, .-move_lines
	.align	2
	.global	prepend
	.type	prepend, %function
prepend:
.LFB33:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 40]
	bl	new_node
	str	x0, [sp, 32]
	ldr	x0, [sp, 40]
	ldr	w0, [x0, 8]
	ldr	w1, [sp, 28]
	cmp	w1, w0
	bne	.L186
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	ldr	x1, [sp, 32]
	bl	move_lines
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x1, [x0]
	adrp	x0, current_line
	add	x0, x0, :lo12:current_line
	str	x1, [x0]
	b	.L185
.L189:
	ldr	x0, [sp, 40]
	ldr	x0, [x0, 16]
	ldr	w0, [x0, 8]
	ldr	w1, [sp, 28]
	cmp	w1, w0
	beq	.L191
	ldr	x0, [sp, 40]
	ldr	x0, [x0, 16]
	str	x0, [sp, 40]
.L186:
	ldr	x0, [sp, 40]
	ldr	x0, [x0, 16]
	cmp	x0, 0
	bne	.L189
	b	.L188
.L191:
	nop
.L188:
	ldr	x0, [sp, 40]
	ldr	x1, [x0, 16]
	ldr	x0, [sp, 32]
	str	x1, [x0, 16]
	ldr	x0, [sp, 40]
	ldr	x1, [sp, 32]
	str	x1, [x0, 16]
	adrp	x0, current_line
	add	x0, x0, :lo12:current_line
	ldr	x1, [sp, 32]
	str	x1, [x0]
.L185:
	bl	fix_line_numbers
	mov	w0, 1
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE33:
	.size	prepend, .-prepend
	.align	2
	.global	replace_words
	.type	replace_words, %function
replace_words:
.LFB34:
	.cfi_startproc
	nop
	ret
	.cfi_endproc
.LFE34:
	.size	replace_words, .-replace_words
	.align	2
	.global	search
	.type	search, %function
search:
.LFB35:
	.cfi_startproc
	nop
	ret
	.cfi_endproc
.LFE35:
	.size	search, .-search
	.section	.rodata
	.align	3
.LC17:
	.string	"Error: No filename provided."
	.align	3
.LC18:
	.string	"r+"
	.align	3
.LC19:
	.string	"No existing file found. Creating new file: %s.\n"
	.align	3
.LC20:
	.string	"Failed to create new file."
	.align	3
.LC21:
	.string	"New file %s created.\n"
	.align	3
.LC22:
	.string	"Loaded document %s. %d lines read:\n"
	.align	3
.LC23:
	.string	"Loaded document %s. 0 lines read.\n"
	.text
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
.LFB36:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	str	w0, [sp, 28]
	str	x1, [sp, 16]
	ldr	w0, [sp, 28]
	cmp	w0, 2
	beq	.L195
	adrp	x0, .LC17
	add	x0, x0, :lo12:.LC17
	bl	puts
	mov	w0, 0
	bl	exit
.L195:
	ldr	x0, [sp, 16]
	ldr	x0, [x0, 8]
	str	x0, [sp, 72]
	adrp	x0, .LC18
	add	x1, x0, :lo12:.LC18
	ldr	x0, [sp, 72]
	bl	fopen
	mov	x1, x0
	adrp	x0, fd
	add	x0, x0, :lo12:fd
	str	x1, [x0]
	ldr	x0, [sp, 72]
	bl	filename_handler
	adrp	x0, fd
	add	x0, x0, :lo12:fd
	ldr	x0, [x0]
	cmp	x0, 0
	bne	.L196
	ldr	x1, [sp, 72]
	adrp	x0, .LC19
	add	x0, x0, :lo12:.LC19
	bl	printf
	adrp	x0, .LC14
	add	x1, x0, :lo12:.LC14
	ldr	x0, [sp, 72]
	bl	fopen
	mov	x1, x0
	adrp	x0, fd
	add	x0, x0, :lo12:fd
	str	x1, [x0]
	adrp	x0, fd
	add	x0, x0, :lo12:fd
	ldr	x0, [x0]
	cmp	x0, 0
	bne	.L197
	adrp	x0, .LC20
	add	x0, x0, :lo12:.LC20
	bl	puts
	bl	__errno_location
	ldr	w0, [x0]
	bl	exit
.L197:
	bl	new_blank_line
	mov	x1, x0
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	str	x1, [x0]
	ldr	x1, [sp, 72]
	adrp	x0, .LC21
	add	x0, x0, :lo12:.LC21
	bl	printf
	b	.L198
.L196:
	str	xzr, [sp, 48]
	str	xzr, [sp, 40]
	mov	w0, 1
	str	w0, [sp, 92]
	adrp	x0, fd
	add	x0, x0, :lo12:fd
	ldr	x2, [x0]
	add	x1, sp, 40
	add	x0, sp, 48
	bl	getline
	str	x0, [sp, 64]
	ldr	x0, [sp, 64]
	cmn	x0, #1
	beq	.L199
	ldr	x0, [sp, 48]
	ldr	x1, [sp, 64]
	ldr	w2, [sp, 92]
	bl	make_line
	mov	x1, x0
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	str	x1, [x0]
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	str	x0, [sp, 80]
	b	.L200
.L201:
	ldr	w0, [sp, 92]
	add	w0, w0, 1
	str	w0, [sp, 92]
	ldr	x0, [sp, 48]
	ldr	x1, [sp, 64]
	ldr	w2, [sp, 92]
	bl	make_line
	str	x0, [sp, 56]
	ldr	x0, [sp, 80]
	ldr	x1, [sp, 56]
	str	x1, [x0, 16]
	ldr	x0, [sp, 56]
	str	x0, [sp, 80]
.L200:
	adrp	x0, fd
	add	x0, x0, :lo12:fd
	ldr	x2, [x0]
	add	x1, sp, 40
	add	x0, sp, 48
	bl	getline
	str	x0, [sp, 64]
	ldr	x0, [sp, 64]
	cmn	x0, #1
	bne	.L201
	ldr	w2, [sp, 92]
	ldr	x1, [sp, 72]
	adrp	x0, .LC22
	add	x0, x0, :lo12:.LC22
	bl	printf
	ldr	x0, [sp, 48]
	bl	free
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x0, [x0]
	bl	print_doc
	b	.L198
.L199:
	bl	new_blank_line
	mov	x1, x0
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	str	x1, [x0]
	ldr	x1, [sp, 72]
	adrp	x0, .LC23
	add	x0, x0, :lo12:.LC23
	bl	printf
.L198:
	adrp	x0, first_line
	add	x0, x0, :lo12:first_line
	ldr	x1, [x0]
	adrp	x0, current_line
	add	x0, x0, :lo12:current_line
	str	x1, [x0]
	adrp	x0, fd
	add	x0, x0, :lo12:fd
	ldr	x0, [x0]
	bl	fclose
	nop
	ldp	x29, x30, [sp], 96
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE36:
	.size	initialize, .-initialize
	.local	fileName.0
	.comm	fileName.0,8,8
	.ident	"GCC: (GNU) 13.2.1 20240316 (Red Hat 13.2.1-7)"
	.section	.note.GNU-stack,"",@progbits
