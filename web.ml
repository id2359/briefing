let get url =
   let conn = Curl.init () and buff = Buffer.create 1763 in
   Curl.set_writefunction conn
      (fun x -> Buffer.add_string buff x; String.length x);
   Curl.set_url conn url;
   Curl.perform conn;
   Curl.global_cleanup ();
   Buffer.contents buff;
    
