%{
  open SlangAst 
%}

%token <string URL
%token <string> IDENT
%token FROM
%token USING
%token AS
%token GET
%token IN
%token REGEXP
%token FUNCTION
%token <int> PATTERN
%token NEWLINE
%token ANGLESLEFT
%token ANGLESRIGHT
%token EOF
%start sourcesfile

%type <SlangAst.ast>  sourcesfile

%%

sourcesfile:
| sources EOF { $1 }
;

sources:
| { [] }
| source NEWLINE sources { $1 :: $3 }
;

source:
| GET IDENT AS IDENT IN IDENT FROM URL  USING REGEXP ANGLESLEFT PATTERN ANGLESRIGHT   { }
| GET IDENT AS IDENT FROM IDENT USING FUNCTION IDENT {}
;


