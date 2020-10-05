#lang sicp

(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (fast-e a b n)
       (cond ((= n 0) a)
             ((even? n) (fast-e a (square b) (/ n 2)))
             (else (fast-e (* a b) b (- n 1)))))
       

(define b 5)
(define p 0)
(fast-expt b p)
(fast-e 1 b p)