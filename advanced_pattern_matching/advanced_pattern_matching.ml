 type ptype = 
  TNormal | TFire | TWater

type mon = 
  { name: string; hp: int; ptype: ptype }

(* ways to get a pokemon hit points *)
(* ok *)
let get_hp m =
  match m with
  | {name=n; hp=h; ptype=t} -> h

(* better *)
let get_hp m =
  match m with
  | {name=_; hp=h; ptype=_} -> h

(* better *)
let get_hp m =
  match m with
  | {name; hp; ptype} -> hp

(* better *)
let get_hp m =
  match m with
  | {hp} -> hp

(* best *)
let get_hp m = m.hp

(* ways to get the 3rd component of a tuple *)

(* ok *)
let thrd t = 
  match t with
  | (x, y, z) -> z

(* good *)
let thrd t =
  let (x, y, z) = t in z

(* better *)
let thrd t =
  let (_,_,z) = t in z

(* best *)
let thrd (_,_,z) = z

(* get the components of a pair *)
let fst (x,_) = x
let snd (_,y) = y