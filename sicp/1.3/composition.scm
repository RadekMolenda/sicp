#lang scheme

(provide my-compose)

(define (my-compose f g)
  (lambda (x)
    (f (g x))))


