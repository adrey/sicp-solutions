#lang sicp

(define (f g)
  (g 2))
(f f)
;(f f)
;(f 2)
;(2 2) - error