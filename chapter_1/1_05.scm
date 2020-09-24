#lang sicp
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))
(test 0 (p))
;in case of normal order computation of (p) would not required
;in case of applicative order - infinite recursion
