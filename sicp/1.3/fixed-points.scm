#lang scheme

(provide tolerance
         fixed-point
         my-sqrt
         verbose-fixed-point
         average)

(define (average x y) (/ (+ x y) 2))

(define tolerance 0.00001)

(define (verbose-fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs(- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs(- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (my-sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))
