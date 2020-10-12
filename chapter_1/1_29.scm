#lang sicp

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))

(define (integral-sim f a b n)
  (define h (/ (- b a) n))
  (define (fk k)
    (f (+ a (* k h))))
  (define (inc2 k) (+ k 2))
  (* (/ h 3.0)
     (+ (fk 0)
        (fk n)
        (* 4 (sum fk 1 inc2 (- n 1)))
        (* 2 (sum fk 2 inc2 (- n 1))))))

(integral-sim cube 0 1 10)
(integral-sim cube 0 1 100)
(integral-sim cube 0 1 1000)
(integral cube 0 2 0.01)