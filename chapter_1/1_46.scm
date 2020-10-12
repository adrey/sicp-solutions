#lang sicp

(define (square x) (* x x))

(define (average a b)
  (/ (+ a b) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define tolerance 0.0001)

(define (iterative-improve good? improve)
  (define (next x x1)
    (if (good? x x1)
        x
        (next x1 (improve x1))))
  (lambda (x) (next x (improve x))))


(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  ((iterative-improve close-enough? f) first-guess))





(define (repeated f n)
  (define (iter k result)
    (if (= k 1)
        (lambda (x) (result x))
        (iter (dec k) (compose f result))))
  (iter n f))

(define (pow x n)
  ((repeated (lambda (k) (* k x)) n) 1))

(define (log2 n)
  (/ (log n) (log 2)))



(define (good-enough? old-guess guess)
  (< (/ (abs (- old-guess guess))
        guess)
     0.001))


(define (sqrt x)
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough? improve) x))


(define (n-root x n)
  (define (k-damp k)
    (repeated average-damp k))
  (fixed-point ((k-damp (floor (log2 n))) (lambda (y) (/ x (pow y (- n 1)))))
               1.0))

(sqrt 100.0)  
(n-root 43046721 16)