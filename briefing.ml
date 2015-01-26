open Printf;;

let  () =
  let html = Web.get Sys.argv.(1) in
  print_endline html;;
