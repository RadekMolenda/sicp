#lang scheme

(require "repeated.scm")
(require "fixed-points.scm")

(provide nth-root
         avg)

(define (avg x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (avg x (f x))))


(define (nth-root n x)
  (define (calculate n x)
    (lambda (y) (/ x (expt y (- n 1)))))
  (fixed-point ((repeated average-damp (- n 1)) (calculate n x))
               1.0))
