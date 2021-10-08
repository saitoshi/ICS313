;;; @author Shin Saito
;;; @assignment ICS 313 Homework 2
;;; @date September 22, 2021

;;; question 1 my-map-reduce

;;; given compose function
(defun compose (f1 f2) (lambda (x) (funcall f1 (funcall f2 x))))

;;; sample my-map function
(defun my-map (f lst)
    (if lst (cons (funcall f (car lst)) (my-map f (cdr lst)))
      nil))

;;; sample my-reduce function
(defun my-reduce (f lst)
    (if (cdr lst) (funcall f (car lst) (my-reduce f (cdr lst)))
        (car lst)))

;;; my-map-reduce function
;;; to tackle this problem i followed the given hints and applied the lambda process
;;; the given hint asked us to do my-map first and then apply my-reduce
;;; takes the first function and applies it to my-map and then takes a second function to do my-reduce
;;; @inputs takes two functions f1 and f2 and a list called lst
;;; @outputs returns a scalar value by applying the selected f1 and f2 inputs
(defun my-map-reduce (f1 f2 lst)
  (funcall (compose (lambda (x) (my-reduce f2 x)) (lambda (x) (my-map f1 x))) lst))
(terpri)
;;; (my-map-reduce (lambda (x) (+ x 1)) #'+ '(1 2 3)) ==> 9
(write (my-map-reduce (lambda (x) (+ x 1)) #'+ '(1 2 3)))
(terpri)

;;; question 2 my-map2 & my-map2-reduce
;;; compose2 function
;;; @inputs two separate functions called f1 and f2
;;; @outputs a lst modified with the f1 and f2 movements
;;; @comments Using the TA`s advice and comments I modified compose function to take a multivariable lambda instead of one in compose

(defun compose2 (f1 f2)
  (lambda ( x y) (funcall f1 (funcall f2 x y ))))

;;; my-map2 function
;;; @inputs: operation and two lists
;;; @outputs: returns a cross product of the two lists
;;; @comments: to approach this function I modified the original my-map to have two lists instead of one
;;; after that with the given sample output from the hw2 page I did a test run
(defun my-map2(f lst1 lst2)
  (if lst1 (cons (funcall f (car lst1)(car lst2))
               (my-map2 f (cdr lst1)(cdr lst2)))
    nil))

;;; when commpiled returns the given result
;;; (my-map2 #'* '(1 2 3) '(4 5 6)) ==> (4 10 18)
(write (my-map2 #'* '(1 2 3) '(4 5 6)))
(terpri)

;;; my-map2-reduce
;;; to tackle this problem I began by writing a dot product function
;;; @function: inner product
;;; @description: if given two lists called l1 and l2 it takes the dot product of it
;;; I wrote this function because I wanted to get a better feeling
;;; @input: two lists called l1 and l2
;;; @output: returns a scalar result of the dot product
(defun dot-product(l1 l2)
  (if (null l1)
      0
    (+(*(car l1)(car l2))
       ( dot-product(cdr l1)(cdr l2)))))
;;; sample run of the dot product function
(write (dot-product'(1 2 3) '(4 5 6)))
(terpri)

;;; after writing the dot product function I began
;;; @function* my-map2-reduce
;;; @input: takes 2 operators and 2 lists
;;; @output: returns the dot product of the two lists
;;; currently my-map2-reduce is not working because it is only applying the first function parameter twice rather than doing it seperately.
;;;
(defun my-map2-reduce (f1 f2 lst1 lst2)
  (if (null lst1)
      0
    (funcall f2 (funcall f1 (car lst1) (car lst2)
                         (my-map2-reduce f1 f2 (cdr lst1) (cdr lst2))))))

(write (my-map2-reduce #'* #'+ '(1 2 3) '(4 5 6)))
(terpri)

(defun copy-without-nils(lst)
(cond ((null lst) NIL)
  ((null (car lst)) (copy-without-nils(cdr lst)))
  ((atom (car lst))(cons (car lst) (copy-without-nils (cdr lst)))
  (T (cons (copy-without-nils (car lst)) (copy-without-nils(cdr lst))))
)
)
)
