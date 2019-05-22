open Base

let sounds = [(3, "Pling"); (5, "Plang"); (7, "Plong")]

let of_bool (is_some: bool) value = if is_some then Some value else None

let get_word input (f, word) = of_bool (input % f = 0) word

let raindrop (input: int): string = 
  List.filter_map sounds ~f:(get_word input)
  |> function
  | [] -> Int.to_string input
  | l -> String.concat l