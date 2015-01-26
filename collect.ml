open Printf;;

type reading = Rfloat of string * float
	       | Rint of string * int
	       | Rstring of string * string;;

let print_reading r = match r with
  | Rfloat (tag, value) -> print_endline tag ^ "=" ^  string_of_float value
  | Rint (tag, value) -> print_endline tag ^ "=" ^ string_of_int value
  | Rstring (tag, value) -> print_endline tag ^ "=" ^ value

let collect_weather html =
  [ Rfloat ("weather", 23.65)];;

let collect_default html =
  [ Rstring ("word", "blah") ];;

let collect reading_tag html =
  match reading_tag with
  | "weather" -> collect_weather html
  | _ -> collect_default html;;

