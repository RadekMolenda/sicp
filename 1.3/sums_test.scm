#lang scheme

(require "sums.scm")

(require test-engine/racket-tests)

(check-expect (sum-integers 1 3) 6)
(check-expect (sum-integers 4 3) 0)
(check-expect (sum-integers 4 6) 15)

(check-expect (sum-cubes 1 3) 36)
(check-expect (sum-cubes 3 2) 0)

(check-expect (sum (lambda (x) x) 1 (lambda (x) (+ x 1)) 3) 6)

(check-expect (my-apply (lambda (x) (+ x 1)) 1) 2)
(check-expect (my-apply (lambda (x) x) 1) 1)

(check-expect (inc 3) 4)

(check-expect (sum-cubes-2 1 3) 36)
(check-expect (sum-cubes-2 1 10) 3025)

(check-expect (identity 1) 1)

(check-expect (sum-integers2 4 6) 15)
(test)
