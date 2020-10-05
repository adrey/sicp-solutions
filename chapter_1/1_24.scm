#lang sicp

(define (square x) (* x x))


(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

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
  (if (fast-prime? n 1)
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
(search-for-primes 1000 1100)
;1009 *** 15
;1013 *** 15
;1019 *** 16
(search-for-primes 1000000000 1000000100)
1000000007 *** 4
1000000009 *** 6
1000000021 *** 4
;estimated relation between (timed-prime-test 10^3) and (timed-prime-test 10^6) is log(10^3) / log(10^6) = 1/2
;log is too slow-growing function to see stable relation on available number range.
;log(1000000000) ~ 20.72, k2 from definition of O-notation have too big impact on result.