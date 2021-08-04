module Utils = struct
  let pl list f =    
    let rec aux l = 
      match l with
      | [] -> ()
      | hd::tl -> f hd; aux tl in
    print_string "[";
    aux list;
    print_endline "]";
  ;;

  let print_list_str list = pl list (Printf.printf {|"%s";|};)
  let print_list_int list = pl list (Printf.printf "%d;")
end