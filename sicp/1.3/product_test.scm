#lang scheme

(require test-engine/racket-tests)

(require "product.scm")

(define (inc x) (+ x 1))
(define (identity x) x)

(check-expect (product identity 1 inc 3) 6)
(check-expect (product identity 1 inc 4) 24)

(test)
