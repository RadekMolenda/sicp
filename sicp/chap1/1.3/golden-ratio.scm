#lang scheme

(require "fixed-points.scm")

(provide golden-ratio)

(define golden-ratio
  (fixed-point (lambda (x) (+ 1 (/ 1 x)))
               1.0))

