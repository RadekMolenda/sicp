#lang scheme

(require "tangent.scm")

(require racket/math)
(require test-engine/racket-tests)

(check-within (tan-cf (/ pi 12) 10) (tan (/ pi 12)) 0.0001)
(check-within (tan-cf (/ pi 5) 10) (tan (/ pi 5)) 0.0001)

(test)
