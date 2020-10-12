#lang sicp

(define (square x) (* x x))

(define (average a b)
  (/ (+ a b) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define tolerance 0.0001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


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


;log2(n) damps required for n-root
(define (n-root x n)
  (define (k-damp k)
    (repeated average-damp k))
  (fixed-point ((k-damp (floor (log2 n))) (lambda (y) (/ x (pow y (- n 1)))))
               1.0))

(n-root 43046721 16)