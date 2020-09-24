#lang sicp
(define (square x) (* x x))

(define (good-enough? old-guess guess)
  (< (/ (abs (- old-guess guess))
        guess)
     0.001))

(define (good-enough-absolute? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter old-guess guess x)
  (if (good-enough? old-guess guess)
      guess
      (sqrt-iter guess (improve guess x)
                 x)))

(define (sqrt-iter-absolute guess x)
  (if (good-enough-absolute? guess x)
      guess
      (sqrt-iter-absolute (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 2.0 1.0 x))

(define x 100000000000.11)
(square (sqrt x))
(square (sqrt-iter-absolute 1.0 x))
;relative accuracy will be the same for big and small numbers, absolute accuracy will be worse for big numbers and better for small
