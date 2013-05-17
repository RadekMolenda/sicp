#lang scheme

(provide tan-cf)
(require "continued-fraction.scm")

(define (tan-cf x k)
  (define (n a) (if (= a 1) x (- 0 (* x x))))
  (define (d a) (- (* 2 a) 1))
  (cont-frac-i n d k))
