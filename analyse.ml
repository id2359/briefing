open Printf;;

let write_fact reading output_chan = match reading with
  | Collect.Rfloat (tag, value) ->
	let fact = "(reading " ^ tag ^ " " ^ string_of_float value ^ ")" in
	fprintf output_chan "%s\n" fact
  | _ -> ();;

let write_facts readings fact_filename =
  let output_chan = open_out fact_filename in
  List.map (fun r -> write_fact r output_chan ) readings;
  close_out output_chan;;


  
