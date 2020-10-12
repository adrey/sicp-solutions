#lang sicp

(define (cube x) (* x x x))

(define (square x) (* x x))

(define (identity x) x)

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (filtered-accumulate condition combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (if (condition a)
                  (combiner (term a) result)
                  result))))
  (iter a null-value))

(define (sim-mul n)
  (define (simple-n? i)
    (= (gcd i n) 1))
  (filtered-accumulate simple-n? * 1 identity 1 inc n))


(filtered-accumulate prime? + 0 square 2 inc 5)
(sim-mul 5)


  
