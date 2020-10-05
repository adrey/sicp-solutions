#lang sicp

(define (square x) (* x x))



(define (expmod base exp m)
  (define (rem-if-trivial e)
    (define rem (remainder (square e) m))
    (if (and (= rem 1)
             (not (or (= e 1) (= e (- m 1)))))
        0
        rem))
  (cond ((= exp 0) 1)
        ((even? exp)
         (rem-if-trivial (expmod base (/ exp 2) m)))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (define res (expmod a (- n 1) n))
    (= res 1))
  (try-it (+ 1 (random (- n 1)))))

(define (prime? n times)
  (cond ((= times 0) #true)
        ((fermat-test n) (prime? n (- times 1)))
        (else #false)))

(define t 1)
(prime? 561 t)
(prime? 1105 t)
(prime? 1105 t)
(prime? 10000987 t)
(prime? 100 t)
(prime? 1729 t)
(prime? 2465 t)
(prime? 2821 t)
(prime? 6601 t)
(prime? 10000591 t)
(prime? 10000609 t)
(prime? 10000643 t)


