#lang scheme

(require test-engine/racket-tests)
(require "continued-fraction.scm")

(define golden-ratio
  (/ (+ 1 (sqrt 5)) 2))
(define (t i) 1.0)

(check-within (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 10) (/ 1.0 golden-ratio) 0.0001)

(check-within (cont-frac-i (lambda (i) 1.0) (lambda (i) 1.0) 10) (/ 1.0 golden-ratio) 0.0001)

(test)
