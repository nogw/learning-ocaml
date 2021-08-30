(* hash table interface *)

module type TableMap = sig
  type ('k, 'v) t
  val insert : 'k -> 'v -> ('k, 'v) t -> unit
  val find : 'k -> ('k, 'v) t -> 'v option
  val remove : 'k -> ('k, 'v) t -> unit
  val create : ('k -> int) -> int -> ('k, 'v) t
  val bindings : ('k, 'v) t -> ('k * 'v) list
  val of_list : ('k -> int) -> ('k * 'v) list -> ('k, 'v) t
end

(* hash table representation type *)

type ('k, 'v) t = {
  hash : 'k -> int;
  mutable size : int;
  mutable buckets : ('k * 'v) list array
}

(* hash table implementation *)

module HashMap : TableMap = struct
  type ('k, 'v) t = {
    hash : 'k -> int;
    mutable size : int;
    mutable buckets : ('k * 'v) list array
  }

  let capacity { buckets } = 
    Array.length buckets
  
  let load_factor tab = 
    float_of_int tab.size /. float_of_int (capacity tab)

  let create hash n =
    { hash; size = 0; buckets = Array.make n [] }
    
  let index k tab = 
    (tab.hash k) mod (capacity tab)
  
  let insert_no_resize k v tab =
    let b = index k tab in 
    let old_bucket = tab.buckets.(b) in
    tab.buckets.(b) <- (k,v) :: List.remove_assoc k old_bucket; (* O(L) *)
    if not (List.mem_assoc k old_bucket) then
      tab.size <- tab.size + 1;
    ()
  
  let rehash tab new_capacity = 
    let rehash_binding (k, v) =
      insert_no_resize k v tab
    in
    let rehash_bucket bucket = 
      List.iter rehash_binding bucket
    in
    let old_buckets = tab.buckets in
    tab.buckets <- Array.make new_capacity [];
    tab.size <- 0;
    Array.iter rehash_bucket old_buckets

  let resize_if_needed tab =
    let lf = load_factor tab in
    if lf > 2.0 then
      rehash tab (capacity tab * 2)
    else if lf < 0.5 then
      rehash tab (capacity tab / 2)
    else ()

  let insert k v tab =
    insert_no_resize k v tab;
    resize_if_needed tab 

  let find k tab =
    List.assoc_opt k tab.buckets.(index k tab)

  let remove_no_resize k tab =
    let b = index k tab in
    let old_bucket = tab.buckets.(b) in
    tab.buckets.(b) <- List.remove_assoc k tab.buckets.(b);
    if List.mem_assoc k old_bucket then
      tab.size <- tab.size - 1;
    ()

  let remove k tab = 
    remove_no_resize k tab;
    resize_if_needed tab

  let bindings tab =
    Array.fold_left
      (fun acc bucket -> 
        List.fold_left
          (fun acc (k, v) -> (k, v) :: acc)
          acc bucket
        )
      [] tab.buckets

  let of_list hash lst =
    let m = create hash (List.length lst) in
    List.iter (fun (k, v) -> insert k v m) lst;
    m  
end