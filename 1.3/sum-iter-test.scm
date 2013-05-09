#lang scheme

(require "sum-iter.scm")

(require test-engine/racket-tests)

(check-expect (sum (lambda (x) x) 1 (lambda (x) (+ x 1)) 3) 6)
(check-expect (sum (lambda (x) (+ x 1)) 1 (lambda (x) (+ x 1)) 5) 20)
(test)
