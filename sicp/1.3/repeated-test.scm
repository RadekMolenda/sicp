#lang scheme

(require "repeated.scm")
(require test-engine/racket-tests)

(define (square x) (* x x))
(define (inc x) (+ x 1))

(check-expect ((repeated square 2) 5) 625)
(check-expect ((repeated inc 5) 5) 10)

(test)
