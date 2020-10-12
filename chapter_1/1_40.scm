#lang sicp

(define (cubic a b c)
  (lambda (x)
    (+ (* x x x) (* a x x) (* b x) c)))

((cubic 1 1 1) 1)
((cubic 0 0 0) 10)


