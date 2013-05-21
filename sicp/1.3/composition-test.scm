#lang scheme

(require "composition.scm")
(require test-engine/racket-tests)

(define (inc x) (+ x 1))
(define inc-by-two (my-compose inc inc))
(define (square x) (* x x))

(check-expect ((my-compose square inc) 6) 49)
(check-expect ((my-compose square inc-by-two) 5) 49)

(test)
