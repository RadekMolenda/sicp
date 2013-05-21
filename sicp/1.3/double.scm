#lang scheme

(provide double)

(define (double f)
  (lambda (x)
    (f (f x))))
