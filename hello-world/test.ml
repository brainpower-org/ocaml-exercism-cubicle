open OUnit2
open Hello_world

let ae ~skip exp got _test_ctxt = 
     skip_if skip "Skipped";
     assert_equal ~printer:(fun x -> x) exp (got ())

let tests = [
     "Say Hi!" >:: ae ~skip:false "Hello, World!" (fun _ -> hello);
]

let () =
  run_test_tt_main ("Hello World tests" >::: tests)
