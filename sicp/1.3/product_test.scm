#lang scheme

(require test-engine/racket-tests)

(require "product.scm")

(define (inc x) (+ x 1))
(define (inc-by-two x) (inc (inc x)))
(define (identity x) x)

(check-expect (product identity 1 inc 3) 6)
(check-expect (product identity 1 inc 4) 24)
(check-expect (product identity 1 inc-by-two 4) 3)

(check-expect (producti identity 1 inc 3) 6)
(check-expect (producti identity 1 inc 4) 24)
(check-expect (producti identity 1 inc-by-two 4) 3)


(test)
