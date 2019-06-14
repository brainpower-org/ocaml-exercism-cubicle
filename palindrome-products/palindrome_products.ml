open Base

type palindrome_products = {
  value : int;
  factors : (int * int) list;
} [@@deriving show, eq]

let range ~min ~max ~f = Base.Sequence.init (max - min + 1) ~f

let invalid_bounds ~min ~max = Caml.Format.sprintf "invalid input: min is %i and max is %i" min max
let none_found ~min ~max = Caml.Format.sprintf "no palindrome with factors in the range %d to %d" min max

let create_palindrome x y =  { value=(y * (x + 1)); factors=[(y, (x + 1))] }

let products ~min ~max =
  let rec products' y l =
    if y = max then 
      l
    else 
      Base.Sequence.append l (range ~min ~max ~f:(fun x -> create_palindrome x y))
      |> (fun s -> products' (y + 1) s)
  in
  products' min Base.Sequence.empty

let is_palindrome y = String.equal (Caml.string_of_int y) (Base.String.rev (Caml.string_of_int y))

let smallest ~min ~max =
  if min >= max then
    Error (invalid_bounds ~min ~max)
  else
    (products ~min ~max)
    |> Sequence.hd
    |> Result.of_option ~error:(none_found ~min ~max)

let largest ~min ~max =
  Error ""