#lang sicp

(define (even? n)
  (= (remainder n 2) 0))

(define (double x) (+ x x))

(define (half x) (/ x 2))

(define (mul a b)
  (if (= b 0)
      0
      (+ a (mul a (- b 1)))))


(define (fast-mul a b)
  (cond ((= b 1) a)
        ((even? b) (fast-mul (double a) (half b)))
        (else (+ a (fast-mul a (- b 1))))))

(fast-mul 5 25)