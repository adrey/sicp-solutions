#lang sicp
(define (cube x) (* x x x))
(define (square x) (* x x))

(define (good-enough? old-guess guess)
  (< (/ (abs (- old-guess guess))
        guess)
     0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (/ (+ (/ x (square guess)) guess guess)
     3))

(define (crt-iter old-guess guess x)
  (if (good-enough? old-guess guess)
      guess
      (crt-iter guess (improve guess x)
                 x)))


(define (crt x)
  (crt-iter 2.0 1.0 x))

(define x 1000)
(crt x)
(cube (crt x))