#lang scheme

(require test-engine/racket-tests)

(require "simpsons-rule.scm")

(define cube (lambda (x) (* x x x)))


(check-within (integral cube 0 1 100) 0.25 0.000001)
(test)
