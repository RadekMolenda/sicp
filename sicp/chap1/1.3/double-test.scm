#lang scheme

(require "double.scm")
(require test-engine/racket-tests)

(define (inc x) (+ x 1))
(define inc-by-two (double inc))

(display (((double (double double)) inc) 5))
(newline)

(check-expect ((double inc) 1) 3)
(check-expect (inc-by-two 3) 5)

(test)
