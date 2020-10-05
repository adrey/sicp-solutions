#lang sicp

(define (square x) (* x x))

(define (fib-old n)
  (fib-iter-old 1 0 n))

(define (fib-iter-old a b count)
  (if (= count 0)
      b
      (fib-iter-old (+ a b) a (- count 1))))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (* 2 p q) (square q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(define n 17)
(fib-old n)
(fib n)
