#lang sicp
;By definition x is fixed point if f(x) = x.
;by substitution φ in equation x = 1 + 1/x we will get
;1 + 2/(1 + sqrt(5)) = (1 + sqrt(5))/2
;It's a true equality.

(define tolerance 0.0001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (gold-transform x)
  (+ 1 (/ 1 x)))

(fixed-point gold-transform 1.0)
;1.61805555