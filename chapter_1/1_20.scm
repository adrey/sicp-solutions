#lang sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(gcd 206 40)

(gcd 40 (rem 206 40))
(if (= (rem 206 40) 0));6 rem executions: 1
(gcd (rem 206 40) (rem 40 (rem 206 40)))
(if (= (rem 40 (rem 206 40)) 0));4 rem executions: 2
(gcd (rem 40 (rem 206 40))
     (rem (rem 206 40) (rem 40 (rem 206 40))))
(if (= (rem (rem 206 40) (rem 40 (rem 206 40))) 0));2 rem executions: 4
(gcd
 (rem (rem 206 40) (rem 40 (rem 206 40)))
 (rem (rem 40 (rem 206 40))  (rem (rem 206 40) (rem 40 (rem 206 40)))))
(if (= (rem (rem 40 (rem 206 40))  (rem (rem 206 40) (rem 40 (rem 206 40))))
       0);0 rem executions: 7
(rem (rem 206 40) (rem 40 (rem 206 40))); rem executions: 4
;18 remainder executions in normal ordering
(gcd 206 40)
(gcd 40 (rem 206 40))
(gcd 6 (rem 40 6))
(gcd 4 (rem 6 4))
(gcd 2 (rem 4 2))
;4 remainder executions in applicative ordering