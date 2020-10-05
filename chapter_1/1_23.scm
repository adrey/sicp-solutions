#lang sicp

(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

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
(search-for-primes 1000 2000); time ~2
(search-for-primes 10000 11000); time ~5
(search-for-primes 100000 101000);time ~14
(search-for-primes 1000000 1001000);time ~41
(search-for-primes 10000000 10001000);time ~125
(search-for-primes 100000000 100001000);time ~400

;relation is about 2/3
;we reduced number of `find-divisor` calls but added comparition in `next` function