#lang sicp

(define (square x) (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (define (iter k result)
    (if (= k 1)
        (lambda (x) (result x))
        (iter (dec k) (compose f result))))
  (iter n f))

(define dx 0.000001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx)))
                 3)))

(define (n-smooth f n)
  ((repeated smooth n) f))

((smooth square) 5)
((smooth (smooth square)) 5)
((n-smooth square 1) 5)
((n-smooth square 2) 5)
((n-smooth square 10) 5) 