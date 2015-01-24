let () =
  let html = Web.get "http://www.smh.com.au" in
  Printf.printf html
