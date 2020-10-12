#lang sicp

(define (cube x) (* x x x))

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))
  ;(if (> a b)
  ;    null-value
  ;    (combiner (term a)
  ;              (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (identity x) x)

(define (factorial n)
  (product identity 1 inc n))

(define (square x) (* x x))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))

(define (pi n)
  (define (inc2 x) (+ x 2))
  (define (fk k)
    (define 2k (* 2.0 k))
    (/ (square 2k) (* (- 2k 1) (+ 2k 1))))
  (/ (* (/ 1 3) 4 2 2 n (product fk 2 inc (- n 1))) (- (* 2 n) 1)))


(pi 10000)

(integral cube 0 1 0.01)

(factorial 10)