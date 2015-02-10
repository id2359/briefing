{
  open SlangParser
  exception Eof
}

let alpha = ['a'-'z']

rule token = parse
  [' ' '\t']     { token lexbuf }
| ['\n' ]        { EOL }
| 'get'          { GET }
| '"'            { QUOTE }
| 'from'         { FROM }
| 'as'           { AS }
| 'in'           { IN }
| 'using'        { USING }
| 'float' 
| 'integer'
| 'string' as dt { DATATYPE dt }
| alpha+ as x    { IDENT x }
| _              { token lexbuf }
| eof            { raise End_of_file }
