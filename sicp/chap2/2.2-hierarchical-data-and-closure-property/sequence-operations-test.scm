#lang racket

(require "sequence-operations.scm")
(require test-engine/racket-tests)

(check-expect (map (lambda (x) x) '(1 2 3)) '(1 2 3))
(check-expect (map (lambda (x) (+ x 1)) '(1 2 3)) '(2 3 4))
(check-expect (append '(1 2 3) '(3 2 1)) '(1 2 3 3 2 1))
(check-expect (length '(1 2 3)) 3)
(check-expect (length '(1 2 3 4 1 1)) 6)

(check-expect (horner-eval 2 '(1 3 0 5 0 1)) 79)

(check-expect (enumerate-tree '((1 2) (3 4))) '(1 2 3 4))
(check-expect (count-leaves '((1 2) (3 4))) 4)

(define s '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))

(check-expect (accumulate-n + 0 s) '(22 26 30))

(check-expect (map* (lambda (x y) (+ x y)) '(1 2 3) '(3 4 5)) '(4 6 8))
(check-expect (map* (lambda (x y z) (+ x y z)) '(1 2 3) '(3 4 5) '(0 0 0)) '(4 6 8))
(check-expect (map* (lambda (x y z) (+ x y z)) '(1 2 3) '(3 4 5) '(0 0 0 0 0)) '(4 6 8))

(check-expect (dot-product '(1 2 3) '(4 5 6)) 32)

(check-expect (transpose '((2 3 1 4) (-1 2 0 1) (2 2 0 1))) '((2 -1 2) (3 2 2) (1 0 0) (4 1 1)))

(check-expect (matrix-*-matrix '((1 2 3) (4 5 6)) '((7 8) (9 10) (11 12))) '((58 64) (139 154)))

(test)
