(**@filename SaitoShin03.ml*)
(**@name Shinya Saito*)
(**@description File created for homework 3 for ICS 313*)
(** Compose Function *)
let compose f1 f2 = (fun x -> f1 (f2 x));;

(** Map Function *)
let rec map f = function
  | [] -> []
  | first :: rest -> f first :: map f rest;;

(** Reduce Function *)
let rec reduce f init = function
  | [] -> init
  | first :: rest -> f first (reduce f init rest);;

(** Question 4.1 *)
(** MapReduce Function *)
(** @input: Should take in a linked list and a parameter functions *)
(** @output: Based on the two parameters the linked list should return a scalar *)
(** @description: using the compose function map the function based on f1 input and then reduce based on the f2 input*)
let rec mapreduce f1 f2 int = compose (reduce f2 int)(map f1) ;;

mapreduce (fun x -> x + 1) (fun x y -> x + y) 0  [1; 2; 3];;
(** val mapreduce : ('a -> 'b) -> ('b -> 'c -> 'c) -> 'c -> 'a list -> 'c = <fun> *)

(** Question 4.2 *)
(**Compose2: Similar to compose but the difference is that it takes two lists instead of 1*)
(**@input* takes in two functions and two lists *)

let compose2 f1 f2 =
  (fun x y -> f1 (f2 x y)) ;;

(**Map2: Function: takes an operator and two lists as its argument and returns a single combined list*)
(** @input: takes in a function (f1) and two linked lists (l1 l2) *)
(** @output: returns a linked list based on the operator parameter *)
let rec map2 f1 l1 l2 =
  (match (l1, l2) with
     ([],x) -> x
   | (x,[]) -> x
   | (first1 :: rest1, first2 :: rest2) ->
       (f1 first1 first2) :: (map2 f1 rest1 rest2))  ;;
(** val map2 : ('a -> 'a -> 'a) -> 'a list -> 'a list -> 'a list = <fun> *)

(**Map2Reduce:  *)
(**@input: takes two function f1 and f2 and two lists l1 and l2 *)
(**@output: based on the f1 and f2 should spit out the inner product*)
let rec map2reduce f1 f2 int = compose2(reduce f2 int) (map2 f1) ;;

(** Question 4.3 *)
let even x = (x mod 2) = 0;;

let odd x = (x mod 2) = 1;;

(** mapf function *)
(**@input takes two lst where the first list is filled w functions and the other is digits*)
(**@param flst: list of functions *)
(**@lst: the list that will be applied with the function *)
(**@output returns an iterated (?) list based on the list of functions*)
let rec mapf flst lst =
  match (flst, lst) with
  | ([], _) -> []
  | (_, []) -> []
  | (first :: rest , lst) -> (map (fun x -> first x) lst :: mapf rest lst) ;;

(** Question 4.4 *)
(** Mappairreduce *)

(**mappair function*)
(**@param f: function *)
(** l1 l2: the two lists *)
(**@output: prints out a result similar to map function, a list applied with the f *)
let rec mappair f l1 l2 =
  match (l1, l2) with
    ([], x) -> x
  |(x,[]) -> x
  | (first1 :: rest1, first2 :: rest2) ->
      (f(first1, first2)) :: (mappair f rest1 rest2) ;;

let rec reduce2 f init = function
  | [] -> init
  | first :: rest -> f (first, (reduce2 f init rest));;

(**mappairreduce*)
(**Similar to map2reduce but takes a pair of list instead of two separate lists*)
(**@input f1 f2: two functions *)
(** (l1 l2) the pair of lists *)
(**@output*)
let mappairreduce f1 f2 init (l1, l2) =
  reduce f2 init (mappair f1 l1 l2);;

(**Results to show that the code works*)
print_string "Testing the Code" ;;
print_string "_________________" ;;
print_string "\n" ;;
let m = mapreduce (fun x -> x + 1) (fun x y -> x + y) 0  [1; 2; 3];;
print_string "Result for mapreduce (fun x -> x + 1) (fun x y -> x + y) 0  [1; 2; 3]:: " ;;
print_int m ;;
let n = map2reduce (fun x y -> x * y) (fun x y -> x + y) 0 [1; 2; 3] [4; 5; 6];;
print_string "Results for: map2reduce (fun x y -> x * y) (fun x y -> x + y) 0 [1; 2; 3] [4; 5; 6]" ;;
print_int n ;;
print_string "\n";;
print_string "Results for: mapf [even; odd] [0; 1; 2; 3; 4; 5; 6; 7] " ;;
let s = mapf [even; odd] [0; 1; 2; 3; 4; 5; 6; 7] ;;

print_string "\n";;
let p = mappairreduce (fun (x, y) -> x * y) (fun (x, y) -> x + y) 0 ([1; 2; 3], [4; 5; 6]);;
print_string "Results for: mappairreduce (fun (x, y) -> x * y) (fun (x, y) -> x + y) 0 ([1; 2; 3], [4; 5; 6])" ;;
print_int p ;;
print_string "\n";;
