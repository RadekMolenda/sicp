#lang scheme

(require "fixed-points.scm")

(require test-engine/racket-tests)

(check-within (fixed-point cos 1.0) 0.7390822 tolerance)

(check-within (my-sqrt 3) (sqrt 3) tolerance)

(test)
