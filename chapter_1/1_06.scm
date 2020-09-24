#lang sicp
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))
;new-if isn't special form so operands computation is required, it leads to infinite recursion
