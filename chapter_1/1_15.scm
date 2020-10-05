#lang sicp
(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
;p will be called 5 times
;mem usage - O(a), computations - O(a)