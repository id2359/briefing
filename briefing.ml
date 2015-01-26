open Printf;;

let  () =
  let html = Web.get "http://www.smh.com.au" in
  print_endline html;;
