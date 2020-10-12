#lang sicp

(define (square x) (* x x))

(define (double f)
  (lambda (x) (f (f x))))

((double inc) 1)
((double square) 2)

(((double (double double)) inc) 5)
; 4x4       2x2       x2 -> inc 16

(((double (double (double double))) inc) 5)
;256 + 5


