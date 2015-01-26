let main () =
  let html = Web.get "http://www.smh.com.au" in
  print_string html
