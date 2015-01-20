type analysis
val write_facts : Collect.reading list -> string  -> unit (* write readings to file *)
val run_analysis : string * string -> analysis (* rule file , fact file -> run clips and create analysis *)
 
