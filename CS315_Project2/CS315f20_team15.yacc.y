%{
void yyerror(char* s);
extern int yylineno; 
%}

%token BEG
%token END
%token VAR
%token INTEGER
%token INT
%token CHARACTER
%token DOUBLE
%token STR
%token CHAR
%token BOOLEAN
%token FOR
%token DO
%token WHILE
%token IF
%token ELSE
%token FUNCTION
%token HEPIN
%token HEPOUT
%token LP
%token RP
%token LB
%token RB
%token LSB
%token RSB
%token ASSIGN_OPERATOR
%token GREATER
%token LESS THEN
%token CHECK_EQUAL
%token COMMA
%token SEMICOLON
%token OR
%token AND
%token MINUS
%token PLUS
%token DIVIDE
%token MULTI
%token REMAIN
%token COMMENT
%token IDENTIFIER
%token RETURN
%token READ_INCLINE
%token READ_ALTITUDE
%token READ_TEMPERATURE
%token READ_ACCELERATION
%token ON_CAMERA
%token OFF_CAMERA
%token TAKE_PICTURE
%token READING_TIME
%token CONNECT_COMPUTER
%token XOR
%token NOT_EQUAL_OP
%token LESS_THEN
%token LOWER_OR_EQ_OP
%token GREATER_OR_EQ_OP
%token HASHTAG
%token INC_AND
%token INC_OR
%%

//Program
program:
		BEG stmt_list END {printf("Input program is valid\n");}

stmt_list:
		| stmt_list stmt_set

//————————different statement types

stmt_set: 
		non_if_stmt
		| if_stmt

last_stmt:
		SEMICOLON

if_stmt:
		IF LP logical_expr RP LB HASHTAG stmt_list HASHTAG RB
		| IF LP logical_expr RP LB HASHTAG stmt_list HASHTAG RB ELSE LB HASHTAG stmt_list HASHTAG RB



non_if_stmt:
		declare_stmt
		| do_while_stmt
		| while_stmt
		| for_stmt
		| output_stmt
		| COMMENT
		| return_stmt
		| function_declare
		| drone_stmts
		| function_call

//—————————declarations and initilizations

declare_stmt:
		var_declare
		| term

var_declare:
		term ASSIGN_OPERATOR assignment_values

assignment_values:
			logical_expr

//—— function declare, function call, return stmt

function_declare:
		term LP parameters RP LB stmt_list RB

function_call:
		term LP parameters RP

parameters:
		param_element
		| param_element COMMA parameters

param_element:
			term
			| constant
return_stmt:
		RETURN expressions

//———————loop statements

for_stmt:
		FOR LP var_declare last_stmt logical_expr last_stmt var_declare RP LB stmt_list RB

while_stmt:
		WHILE LP logical_expr RP LB stmt_list RB

do_while_stmt:
		DO LB stmt_list RB WHILE LP logical_expr RP

//———————

	

//——— other statements

input_stmt:
		HEPIN LP input_body RP

input_body:
		term

output_stmt: HEPOUT LP output_body RP

output_body:
		primary_expr
		| primary_expr PLUS output_body
		|

drone_stmts:
		primitive_functions

primitive_functions:
			read_incline 
			|read_altitude
			|read_temperature
			|read_acceleration
			|on_camera
			|off_camera
			|take_picture
			|reading_time
			|connect_computer

read_incline:
		READ_INCLINE LP RP

read_altitude:
		READ_ALTITUDE LP RP

read_temperature:
			READ_TEMPERATURE LP RP

read_acceleration:
			READ_ACCELERATION LP RP

on_camera:
		ON_CAMERA LP RP

off_camera:
		OFF_CAMERA LP RP

take_picture:
		TAKE_PICTURE LP RP

reading_time:
		READING_TIME LP RP

connect_computer:
		CONNECT_COMPUTER LP RP


//——expressions——

expressions:
		logical_expr

logical_expr:
		logical_op 

logical_op:
		or

or:
	and
	| or OR and

and: 
	in_logic_or
	| and AND in_logic_or

in_logic_or:
		out_logic_or
		| in_logic_or INC_OR out_logic_or

out_logic_or:
		in_logic_and
		| out_logic_or XOR in_logic_and

in_logic_and:
		equality_check
		| in_logic_and INC_AND equality_check

equality_check:
		comparator
		| equality_check CHECK_EQUAL comparator
		| equality_check NOT_EQUAL_OP comparator

comparator:
		arithmetic_op
		| comparator LESS_THEN additive
		| comparator GREATER additive
		| comparator LOWER_OR_EQ_OP additive
		| comparator GREATER_OR_EQ_OP additive

arithmetic_op:
		additive

additive:
		multiplicative
		| additive PLUS multiplicative
		| additive MINUS multiplicative

multiplicative:
		primary_expr
		| multiplicative MULTI primary_expr
		| multiplicative DIVIDE primary_expr
		| multiplicative REMAIN primary_expr

primary_expr:
		term
		| LP expressions RP
		| constant
		| drone_stmts
		| input_stmt
		| function_call
		
//———— others

term:
	var

var:
	IDENTIFIER

constant:
	INTEGER
	| BOOLEAN
	| STR
	| DOUBLE
	


%%
#include "lex.yy.c"
void yyerror(char *s) { printf("%s on line %d\n", s, yylineno);}
int main() {
  return yyparse();
}

