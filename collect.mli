type reading        (** a datum grabbed from the web - eg tomorrows max temperature *)
val read_url : string -> reading (** hmm this is wrong *)
val read_url_file : string -> reading list (** ditto - change *)
