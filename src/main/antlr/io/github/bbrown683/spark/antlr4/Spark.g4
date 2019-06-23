grammar Spark;

translationUnit : declaration EOF;

declaration : (annotationDeclaration
    | functionDeclaration 
    | importDeclaration 
    | objectDeclaration
    | packageDeclaration)+;

functionDeclaration : LET IDENTIFIER (IDENTIFIER)* ARROW? EQUALS;
importDeclaration : IMPORT (IDENTIFIER PERIOD)* IDENTIFIER;
objectDeclaration : accessModifier objectType IDENTIFIER constructorDeclaration? EQUALS;
packageDeclaration : PACKAGE (IDENTIFIER PERIOD)* IDENTIFIER;
variableDeclaration : accessModifier IDENTIFIER IDENTIFIER;
constructorDeclaration : LPAREN (annotationDeclaration* IDENTIFIER COLON IDENTIFIER)* RPAREN;
annotationDeclaration : AT IDENTIFIER;

statement : 
    | FOR expression IN statement
    | IF expression THEN (ELSE statement)?
    | MATCH expression WITH statement
    | WHILE expression DO statement;

expression :
    | expression symbol=(ASTERISK | SLASH | PERCENT) expression
    | expression symbol=(PLUS | HYPHEN) expression;

matchBlock : PIPE IDENTIFIER ARROW;

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

// Keywords
ANNOTATION : 'annotation';
CATCH : 'catch' ;
DO : 'do' ;
ELSE : 'else' ;
FOR : 'for';
IF : 'if';
IN : 'in';
IMPORT : 'import';
INTERFACE : 'interface';
LET : 'let';
MATCH : 'match';
NEW : 'new';
OBJECT : 'object';
PACKAGE : 'package';
PRIVATE : 'private';
PROTECTED : 'protected';
PUBLIC : 'public';
THEN : 'then';
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