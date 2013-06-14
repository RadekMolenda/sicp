#lang scheme

(require test-engine/racket-tests)

(require "golden-ratio.scm")

(define tolerance 0.00001)

(check-within golden-ratio (/ (+ 1 (sqrt 5)) 2) 0.00001)

(test)
