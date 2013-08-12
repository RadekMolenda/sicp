#lang scheme

(require "segments.scm")
(require test-engine/racket-tests)

(define point (make-point 1 2))
(define point-b (make-point 3 5))

(check-expect point (cons 1 2))
(check-expect (x-point point) 1)
(check-expect (y-point point) 2)

(define segment (make-segment point point-b))
(check-expect segment (cons point point-b))

(define segement (make-segment (make-point 1 1) (make-point 3 3)))

(check-expect (mid-point segement) (make-point 2 2))

(check-expect (perimeter (make-rectangle point point-b)) 10)
(check-expect (area (make-rectangle point point-b)) 6)


(test)
