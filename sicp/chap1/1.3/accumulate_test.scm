#lang scheme

(require "accumulate.scm")

(require test-engine/racket-tests)

(define (identity x) x)
(define (inc x) (+ x 1))
(define (inc-by-two x) (inc (inc x)))

(check-expect (accumulate + 0 identity 1 inc 5) 15)
(check-expect (accumulate + 0 identity 1 inc-by-two 5) 9)

(check-expect (accumulate-i + 0 identity 1 inc 5) 15)
(check-expect (accumulate-i + 0 identity 1 inc-by-two 5) 9)

(check-expect (sum identity 1 inc 5) 15)
(check-expect (sum identity 1 inc-by-two 5) 9)

(check-expect (product identity 1 inc 5) 120)
(check-expect (product identity 1 inc-by-two 5) 15)

(test)
