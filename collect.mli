type reading        (** a datum grabbed from the web - eg tomorrows max temperature *)

val read_url : string -> Parser.t -> reading
val read_url_file : string -> reading list (** ditto - change *)
