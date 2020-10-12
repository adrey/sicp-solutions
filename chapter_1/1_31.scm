#lang sicp

(define (cube x) (* x x x))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))
  ;(define (iter a result)
  ;  (if (> a b)
  ;      result
  ;      (iter (next a) (* (term a) result))))
  ;(iter a 1))

(define (identity x) x)

(define (factorial n)
  (product identity 1 inc n))

(define (square x) (* x x))

(define (pi n)
  (define (inc2 x) (+ x 2))
  (define (fk k)
    (define 2k (* 2.0 k))
    (/ (square 2k) (* (- 2k 1) (+ 2k 1))))
  (/ (* (/ 1 3) 4 2 2 n (product fk 2 inc (- n 1))) (- (* 2 n) 1)))


(pi 10000)

(factorial 10)