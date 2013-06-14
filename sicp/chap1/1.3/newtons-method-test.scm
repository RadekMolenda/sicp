#lang scheme

(require "newtons-method.scm")

(require test-engine/racket-tests)

(define (cube x) (* x x x))

(display (newtons-method (cubic 1 2 3) 1))
(newline)

(check-within ((deriv cube) 5) 75.0 0.0001)


(test)
