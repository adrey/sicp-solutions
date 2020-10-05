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

(define (fast-mul-iter a b n)
  (cond ((= b 1) (+ a n))
        ((even? b) (fast-mul-iter (double a) (half b) n))
        (else (fast-mul-iter a (- b 1) (+ a n)))))

(define a 3)
(define b 127)
(fast-mul a b)
(fast-mul-iter a b 0)
