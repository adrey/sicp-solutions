#lang sicp

(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 1)
        (/ (n 1) result)
        (iter (dec i)
             (+ (d (dec i))
                   (/ (n i) result)))))
  (iter k (d k)))
  
  ;(define (iter i)
  ;  (if (= i k)
  ;      (/ (n k) (d k))
  ;      (/ (n i) (+ (d i) (iter (inc i))))))
  ;(iter 1))


;1/φ = 0.6180339887
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           12);0.6180257510729613

