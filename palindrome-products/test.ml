open OUnit
open Palindrome_products

let show_result printer = function
| Error e -> "Error " ^ e
| Ok a -> "Ok " ^ printer a

let eq_results eq x y = match (x, y) with
| (Error e1, Error e2) -> String.equal e1 e2
| (Ok x, Ok y) -> eq x y
| _ -> false

let ae ~skip exp got _test_ctxt = 
   skip_if skip "Skipped";
  assert_equal ~printer:(show_result show_palindrome_products) ~cmp:(eq_results equal_palindrome_products) exp (got ())

let tests = [
   "finds the smallest palindrome from single digit factors" >::
      ae ~skip:true (Ok {value=1; factors=[(1,1)]})
         (fun _ -> smallest ~min:1 ~max:9);
   "finds the largest palindrome from single digit factors" >::
      ae ~skip:true (Ok {value=9; factors=[(1,9); (3,3)]})
         (fun _ -> largest ~min:1 ~max:9);
   "find the smallest palindrome from double digit factors" >::
      ae ~skip:true (Ok {value=121; factors=[(11,11)]})
         (fun _ -> smallest ~min:10 ~max:99);
   "find the largest palindrome from double digit factors" >::
      ae ~skip:true (Ok {value=9009; factors=[(91,99)]})
         (fun _ -> largest ~min:10 ~max:99);
   "find smallest palindrome from triple digit factors" >::
      ae ~skip:true (Ok {value=10201; factors=[(101,101)]})
         (fun _ -> smallest ~min:100 ~max:999);
   "find the largest palindrome from triple digit factors" >::
      ae ~skip:true (Ok {value=906609; factors=[(913,993)]})
         (fun _ -> largest ~min:100 ~max:999);
   "find smallest palindrome from four digit factors" >::
      ae ~skip:true (Ok {value=1002001; factors=[(1001,1001)]})
         (fun _ -> smallest ~min:1000 ~max:9999);
   "find the largest palindrome from four digit factors" >::
      ae ~skip:true (Ok {value=99000099; factors=[(9901,9999)]})
         (fun _ -> largest ~min:1000 ~max:9999);
   "empty result for smallest if no palindrome in the range" >::
      ae ~skip:true (Error "no palindrome with factors in the range 1002 to 1003")
         (fun _ -> smallest ~min:1002 ~max:1003);
   "empty result for largest if no palindrome in the range" >::
      ae ~skip:true (Error "no palindrome with factors in the range 15 to 15")
         (fun _ -> largest ~min:15 ~max:15);
   "error result for smallest if min is more than max" >::
      ae ~skip:true (Error "invalid input: min is 10000 and max is 1")
         (fun _ -> smallest ~min:10000 ~max:1);
   "error result for largest if min is more than max" >::
      ae ~skip:true (Error "invalid input: min is 2 and max is 1")
         (fun _ -> largest ~min:2 ~max:1);
]

let () =
  ignore @@ run_test_tt_main ("palindrome product tests" >::: tests)
