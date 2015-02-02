type reading = Rfloat of string * float
	       | Rint of string * int
	       | Rstring of string * string;;


let get_match pattern s =
  try 
    ignore(Str.search_forward pattern s 0);
    Str.matched_string s
  with Not_found -> "-9999";;

let print_reading r = match r with
  | Rfloat (tag, value) -> print_endline ( tag ^ "=" ^  string_of_float value )
  | Rint (tag, value) -> print_endline ( tag ^ "=" ^ string_of_int value )
  | Rstring (tag, value) -> print_endline ( tag ^ "=" ^ value )

let collect_weather html =
  let pattern = Str.regexp "tempnow\">\\(.*\\)\°C</span>" in
  let temperature =
    float_of_string ( get_match pattern html )
  in
  [ Rfloat ("weather", temperature )];;

let collect_default html =
  [ Rstring ("word", "blah") ];;

let collect reading_tag html =
  match reading_tag with
  | "weather" -> collect_weather html
  | _ -> collect_default html;;

