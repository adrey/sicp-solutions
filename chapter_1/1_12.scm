#lang sicp
(define (pascal row column)
  (cond ((= row column) 1)
        ((= 0 column) 1)
        (else (+ (pascal (dec row) column)
                 (pascal (dec row) (dec column))))))
(pascal 4 4)