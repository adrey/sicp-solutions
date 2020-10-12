#lang sicp

(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 1)
        (/ (n 1) result)
        (iter (dec i)
             (+ (d (dec i))
                   (/ (n i) result)))))
  (iter k (d k)))

(define (d i)
  (if (= (remainder i 3.0) 2)
      (* 2
         (+ 1
            (floor (/ i 3))))
      1))

;e~2.718281828
(cont-frac (lambda (n) 1.0)
           d
           10)

