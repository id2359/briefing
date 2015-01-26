type reading (** a datum grabbed from the web - eg tomorrows max temperature *)
val collect : string -> string -> reading list  (** takes tag to dispatch on and parses html string *)
