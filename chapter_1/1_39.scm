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
    (- (* 2.0 i) 1))

(define (tan-cf x k)
  (define (d i)
    (- (* 2.0 i) 1))
  (let ((sqx (* x x -1)))
  (/ (cont-frac (lambda (i) sqx) d k) (* -1 x))))

(tan-cf 10 20)
(tan-cf -5 20)
(tan-cf 3 20)


