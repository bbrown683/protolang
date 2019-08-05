grammar Spark;

translationUnit : declaration EOF;

declaration : (annotationDeclaration
    | enumDeclaration
    | functionDeclaration 
    | importDeclaration 
    | objectDeclaration
    | packageDeclaration)+;

annotationDeclaration : AT IDENTIFIER;

enumDeclaration : accessModifier ENUM IDENTIFIER EQUALS (PIPE? enumField) (PIPE enumField)*;
enumField : IDENTIFIER (LPAREN IDENTIFIER RPAREN)?;

functionDeclaration : LET IDENTIFIER (IDENTIFIER)* ARROW? EQUALS;

objectDeclaration : accessModifier objectType IDENTIFIER constructorDeclaration? EQUALS objectBody;
objectBody : objectMemberDeclaration*;
objectMemberDeclaration : accessModifier THIS PERIOD IDENTIFIER;

variableDeclaration : accessModifier IDENTIFIER IDENTIFIER;

constructorDeclaration : LPAREN (annotationDeclaration* IDENTIFIER COLON IDENTIFIER)* RPAREN;

importDeclaration : IMPORT path;
packageDeclaration : PACKAGE path;
path : (IDENTIFIER PERIOD)* IDENTIFIER;

statement : 
    | FOR forExpression IN statement
    | IF expression THEN statement (ELSE IF expression)* (ELSE statement)?
    | WHILE expression DO statement;

forExpression :
	| IDENTIFIER ':' IDENTIFIER;

expression :
    | expression symbol=(ASTERISK | SLASH | PERCENT) expression
    | expression symbol=(PLUS | HYPHEN) expression;

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
ENUM : 'enum';
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