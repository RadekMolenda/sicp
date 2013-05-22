#lang scheme

(provide smooth)

(define (smooth f)
  (define dx 0.1)
  (lambda (x)
    (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))
