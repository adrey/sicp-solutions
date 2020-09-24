#lang sicp
(define (square x) (* x x))
(define (sum-squares a b) (+ (square a) (square b)))
(define (sum-squares-max-two a b c)
  (cond ((and (> a c) (> b c)) (sum-squares a b))
        ((and (> a b) (> c b)) (sum-squares a c))
        (else (sum-squares b c))))

(sum-squares-max-two 1 2 3)
(sum-squares-max-two 3 2 1)
(sum-squares-max-two 2 1 3)
(sum-squares-max-two 2 2 2)