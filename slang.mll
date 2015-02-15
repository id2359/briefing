{
  open Slangparser
}

let alpha = ['a'-'z']
let digits = ['0'-'9']

rule token = parse
  [' ' '\t']     { token lexbuf }
| ['\n' ]        { EOL }
| "get"          { GET }
| "\""           { QUOTE }
| "from"         { FROM }
| "as"           { AS }
| "in"           { IN }
| "<<"           { ANGLESLEFT }
| ">>"           { ANGLESRIGHT }
| "using"        { USING }
| "float" 
| "integer"
| "string" as dt { DATATYPE dt }
| alpha+ as x    { IDENT x }
| digits+ as d   { PATTERN ( int_of_string d ) }     (* hack - make the pattern an index to a line of another file .. *)
| _              { token lexbuf }
| eof            { raise End_of_file }
