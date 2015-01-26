open Printf;;
(* ocamlfind ocamlc -package curl -linkpkg web.ml` collect.ml briefing.ml -o briefing *)
let () =
  let html = Web.get Sys.argv.(1) in
  let reading_tag = Sys.argv.(2) in   
  let readings = Collect.collect reading_tag html in
  print_endline "done!" (* will eventually create fuzzy clips facts from readings *)
