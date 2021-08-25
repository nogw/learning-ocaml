let uncurry f = fun (x, y) -> f x y 
let uncurried_nth     = uncurry List.nth
let uncurried_append  = uncurry List.append
let uncurried_compare = uncurry Char.compare
let uncurried_max     = uncurry max