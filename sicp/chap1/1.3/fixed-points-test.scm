#lang scheme

(require "fixed-points.scm")

(require test-engine/racket-tests)

(check-within (fixed-point cos 1.0) 0.7390822 tolerance)

(check-within (my-sqrt 3) (sqrt 3) tolerance)

(display "without damping")
(newline)
(verbose-fixed-point (lambda (x) (/ (log 1000) (log x)))
                     2.0)
(newline)
(display "with damping")
(newline)
(verbose-fixed-point (lambda (x) (average x (/ (log 1000) (log x))))
                     2.0)

(test)
