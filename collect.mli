type reading = Rfloat of string * float
	       | Rint of string * int
	       | Rstring of string * string;;

val collect : string -> string -> reading list  (** takes tag to dispatch on and parses html string *)
