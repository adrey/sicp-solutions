#lang sicp

(define (square x) (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter k result)
    (if (= k 1)
        (lambda (x) (result x))
        (iter (dec k) (compose f result))))
  (iter n f))

((repeated square 2) 5)
((repeated inc 5) 1)