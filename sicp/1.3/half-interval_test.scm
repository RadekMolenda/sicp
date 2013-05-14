#lang scheme

(require "half-interval.scm")

(require test-engine/racket-tests)

(check-within (search (lambda (x) x) -1 1) 0 0.0001)

(check-within (half-interval-method sin 2.0 4.0) 3.14 0.01)

(test)

