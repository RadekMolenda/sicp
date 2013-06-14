#lang scheme

(provide euler
         euler-i
         d)

(require "continued-fraction.scm")

(define (n i) 1.0)
(define (d i)
  (cond ((< i 3) i)
        ((= 2 (modulo i 3)) (* 2 (+ 1 (quotient i 3))))
        (else 1)))

(define euler (cont-frac n d 10000))

(define euler-i (cont-frac-i n d 10000))

