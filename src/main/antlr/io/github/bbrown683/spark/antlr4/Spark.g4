grammar Spark;

translationUnit : declaration EOF;

declaration : (
    // annotationDeclaration
    functionDeclaration 
    // | importDeclaration 
    // | objectDeclaration
    | packageDeclaration)+;

// annotationDeclaration : AT IDENTIFIER;

functionDeclaration : LET IDENTIFIER (IDENTIFIER)* ARROW? EQUALS functionBody;
functionBody : IF;

// objectDeclaration : accessModifier objectType IDENTIFIER constructorDeclaration? EQUALS objectBody;
// objectBody : 
    // | unionDeclaration
    // | objectMemberDeclaration*;
// objectMemberDeclaration : accessModifier THIS PERIOD IDENTIFIER;

// unionDeclaration : (PIPE? unionField) (PIPE unionField)*;
// unionField : IDENTIFIER (OF IDENTIFIER)?;

// variableDeclaration : accessModifier IDENTIFIER IDENTIFIER;

// constructorDeclaration : LPAREN (annotationDeclaration* IDENTIFIER COLON IDENTIFIER)* RPAREN;

importDeclaration : IMPORT path;
packageDeclaration : PACKAGE path;
path : (IDENTIFIER PERIOD)* IDENTIFIER;

statement : 
    | flowStatement;

flowStatement : 
    | FOR forExpression IN statement
    | IF expression THEN statement (ELSE IF expression)* (ELSE statement)?
    | WHILE expression DO statement;

forExpression : IDENTIFIER ':' IDENTIFIER;

expression :
    | IDENTIFIER arithmeticOperator IDENTIFIER;

arithmeticOperator : 
    | PLUS
    | HYPHEN
    | ASTERISK
    | SLASH
    | PERCENT;

unaryOperator : 
    | PLUS
    | HYPHEN
    | PLUS PLUS
    | HYPHEN HYPHEN
    | EXCLAMATION;

primitive : 
    | BOOLEAN
    | BYTE
    | CHAR
    | DOUBLE
    | FLOAT
    | INT
    | LONG
    | SHORT;

accessModifier : PUBLIC | PRIVATE | PROTECTED;

objectType : OBJECT | INTERFACE;

literal : 
	| INTEGER_LITERAL
	| STRING_LITERAL;

STRING_LITERAL : '"' ~["\\\r\n] '"';
INTEGER_LITERAL : [0-9]+;

// Keywords
ANNOTATION : 'annotation';
CATCH : 'catch';
DO : 'do';
ELSE : 'else';
FOR : 'for';
IF : 'if';
IN : 'in';
IMPORT : 'import';
INTERFACE : 'interface';
LET : 'let';
MATCH : 'match';
MUTABLE : 'mutable';
NEW : 'new';
OBJECT : 'object';
OF : 'of';
PACKAGE : 'package';
PRIVATE : 'private';
PROTECTED : 'protected';
PUBLIC : 'public';
THEN : 'then';
THIS : 'this';
TRY : 'try';
WHILE : 'while';
WITH : 'with';

// Primitives
BOOLEAN : 'boolean';
BYTE : 'byte';
CHAR : 'char';
DOUBLE : 'double';
FLOAT : 'float';
INT : 'int';
LONG : 'long';
SHORT : 'short';

// Literals
AT : '@';
ARROW : '->';
ASTERISK : '*';
COLON : ':';
EXCLAMATION : '!';
EQUALS : '=';
HYPHEN : '-';
LPAREN : '(';
PERIOD : '.';
RPAREN : ')';
PERCENT : '%';
PIPE : '|';
PLUS : '+';
SLASH : '/';

IDENTIFIER : [a-zA-Z][a-zA-Z0-9_]*;
WS : [ \t\r\n]+ -> skip;