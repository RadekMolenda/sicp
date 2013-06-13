#lang scheme

(require "iterative-improve.scm")
(require test-engine/racket-tests)

(check-within (fixed-point cos 1.0) 0.739 0.001)

(check-within (my-sqrt 4.0) 2.0 0.001)
(check-within (my-sqrt 2.0) 1.414 0.001)

(test)
