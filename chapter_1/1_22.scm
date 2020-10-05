#lang sicp

(define (square x) (* x x))

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

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))

(define (report-prime a elapsed-time)
  (display a)
  (display " *** ")
  (display elapsed-time)
  (newline))

(define (search-for-primes-iter from to)
  (timed-prime-test from)
  (if (< from to)
       (search-for-primes-iter (+ from 2) to)
       (display "done")))
      
(define (search-for-primes from to)
  (if (= (remainder from 2) 0)
      (search-for-primes-iter (inc from) (dec to))
      (search-for-primes-iter from (dec to))))
(search-for-primes 1000 2000); time ~3
;1009 *** 3
;1013 *** 3
;1019 *** 3
(search-for-primes 10000 11000); time ~8
;10007 *** 8
;10009 *** 8
;10037 *** 8
(search-for-primes 100000 101000);time ~21
;100003 *** 22
;100019 *** 21
;100043 *** 21
(search-for-primes 1000000 1001000);time ~62
;1000003 *** 63
;1000033 *** 63
;1000037 *** 63
(search-for-primes 10000000 10001000);time ~215
;10000019 *** 210
;10000079 *** 215
;10000103 *** 220
(search-for-primes 100000000 100001000);time ~625
;100000007 *** 625
;100000037 *** 620
;100000039 *** 625
;time consumptions are quite proportional to sqrt(10)