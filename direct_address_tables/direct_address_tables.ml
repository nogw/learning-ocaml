module type DirectAddressMap = sig
  type 'v t
  val insert : int -> 'v -> 'v t -> unit
  val find : int -> 'v t -> 'v option
  val remove : int -> 'v t -> unit
  val create : int -> 'v t
  val of_list : int -> (int * 'v) list -> 'v t
  val bindings : 'v t -> (int * 'v) list
end

(* Here is an implementation of that interface *)

module ArrayMap : DirectAddressMap = struct
  type 'v t = 'v option array
  let insert k v a =
    a.(k) <- Some v
  let find k a =
    a.(k)
  let remove k a =
    a.(k) <- None

  let create c =
    Array.make c None
  let of_list c lst =
    let a = create c in 
    List.iter (fun (k, v) -> insert k v a) lst;
    a
  let bindings a =
    let bs = ref [] in
    let add_binding k v = 
      match v with
      | None -> ()
      | Some v -> bs := (k, v) :: !bs
    in
      Array.iteri add_binding a;
    !bs
end