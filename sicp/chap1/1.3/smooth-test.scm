#lang scheme

(require "smooth.scm")
(require "repeated.scm")
(require test-engine/racket-tests)

(define (square x) (* x x))

(display (((repeated smooth 3) square) 1))

(test)

