
begin begin
end end
return return

comment	\/\*.*\*\/

sign [+-]
space [ \t]
digit [0-9]
letter [A-Za-z]
alphanumeric {letter}|{digit}


for for
do do 
while while
if if
else else
function function
hepin hepin
hepout hepout


read_incline read_incline
read_altitude read_altitude
read_temperature read_temperature
read_acceleration read_acceleration
on_camera on_camera
off_camera off_camera
take_picture take_picture
reading_time reading_time
connect_computer connect_computer


int_l {sign}?{digit}+
double_l {sign}?{digit}*\.{digit}+
str_l \"([^\\\"]|\\\"|\\\n|\\\\)*\"
char_l \'{alphanumeric}\'
bool_l (true|false)

VAR var

LP \(
RP \)
LB \{
RB \}
LSB \[
RSB \]
ASSIGN_OPERATOR \=
GREATER \>
LESS_THEN \<
CHECK_EQUAL \=\=
GREATER_OR_EQ_OP \>\=
LOWER_OR_EQ_OP \<\=
NOT_EQUAL_OP \!\=
HASHTAG \#

COMMA \,
SEMICOLON \;
OR \|\|
AND \&\&
INC_AND \&
INC_OR \|
XOR \^
MINUS \-
PLUS \+
DIVIDE \/
MULTI \*
REMAIN \%

identifier {letter}{alphanumeric}*

newline \n
%option yylineno
%%

{begin} return (BEG);
{end} return (END);
{return} return (RETURN);



{for} return (FOR);
{do} return (DO);
{while} return (WHILE);
{if} return (IF);
{else} return (ELSE);
{function} return (FUNCTION);
{hepin} return (HEPIN);
{hepout} return (HEPOUT);




{read_incline} return (READ_INCLINE);
{read_altitude} return (READ_ALTITUDE);
{read_temperature} return (READ_TEMPERATURE);
{read_acceleration} return (READ_ACCELERATION);
{on_camera} return (ON_CAMERA);
{off_camera} return (OFF_CAMERA);
{take_picture} return (TAKE_PICTURE);
{reading_time} return (READING_TIME);
{connect_computer} return (CONNECT_COMPUTER);

{int_l} return (INTEGER);
{double_l} return (DOUBLE);
{str_l} return (STR);
{char_l} return (CHARACTER);
{bool_l} return (BOOLEAN);

{VAR} return (VAR);

{LP} return (LP);
{RP} return (RP);
{LB} return (LB);
{RB} return (RB);
{LSB} return (LSB);
{RSB} return (RSB);
{ASSIGN_OPERATOR} return (ASSIGN_OPERATOR);
{GREATER} return (GREATER);
{LESS_THEN} return (LESS_THEN);
{CHECK_EQUAL} return (CHECK_EQUAL);
{GREATER_OR_EQ_OP} return (GREATER_OR_EQ_OP);
{LOWER_OR_EQ_OP} return (LOWER_OR_EQ_OP);
{NOT_EQUAL_OP} return (NOT_EQUAL_OP);
{HASHTAG} return (HASHTAG);


{COMMA} return (COMMA);
{SEMICOLON} return (SEMICOLON);
{OR} return (OR);
{AND} return (AND);
{INC_AND} return (INC_AND);
{INC_OR} return (INC_OR);
{XOR} return (XOR);
{MINUS} return (MINUS);
{PLUS} return (PLUS);
{DIVIDE} return (DIVIDE);
{MULTI} return (MULTI);
{REMAIN} return (REMAIN);

{comment} return (COMMENT);
{identifier} return (IDENTIFIER);
{newline} ;
%%
int yywrap() {return 1;}
