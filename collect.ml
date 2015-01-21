type reading = Rfloat of string * float
	       | Rint of string * int
	       | Rstring of string * string

let read_url url reading_parser =
  try
    let html = Web.get url in
    reading_parser html
  with
      Web.exception -> "ERROR"

