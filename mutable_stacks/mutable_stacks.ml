exception Empty 

module type MutableStack = sig
  type 'a t 
  val empty : unit -> 'a t
  val push : 'a -> 'a t -> unit
  val peek : 'a t -> 'a 
  val pop : 'a t -> unit
end

module MutableRecordStack = struct
  type 'a node = { value: 'a; mutable next : 'a node option }
  type 'a t = { mutable top : 'a node option }
  let empty () = { top = None }
  let push x s = 
    s.top <- Some { value = x; next = s.top }
  let peek s =
    match s.top with
    | None -> raise Empty
    | Some { value } -> value
  let pop s = 
    match s.top with
    | None -> raise Empty
    | Some { next } -> s.top <- next
end

let _ =
  let open MutableRecordStack in
  let s = empty () in 
  (* val s : '_a t = {top = None} *)
  (
    push 1 s,
    (* - : int t = {top = Some {value = 1; next = None}} *)
    push 2 s,
    (* - : int t = {top = Some {value = 2; next = Some {value = 1; next = None}}}  *)
    pop s
    (* - : int t = {top = Some {value = 1; next = None}} *)
  )