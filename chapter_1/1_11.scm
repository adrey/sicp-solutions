#lang sicp
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (f (- n 2))
         (f (- n 3)))))

(define (iter-f a b c count)
  (cond ((= count 3) a)
        ((< count 3) count)
        (else (iter-f (+ a b c) a b (dec count)))))

(define n 20)
(f n)
(iter-f 3 2 1 n)
      
