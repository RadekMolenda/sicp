#lang scheme

(require "tree.scm")
(require test-engine/racket-tests)

(define x '((1 2) (3 4)))
(check-expect (reverse '(1 2)) '(2 1))
(check-expect (reverse '((1 2) (2 3))) '((2 3) (1 2)))
(check-expect (deep-reverse '(2 3)) '(3 2))
(check-expect (deep-reverse '((2 1) (4 3))) '((3 4) (1 2)))
(check-expect (fringe x) '(1 2 3 4))
(check-expect (fringe (list x x)) '(1 2 3 4 1 2 3 4))

(define b (make-branch 1 2))
(define b1 (make-branch 2 3))
(define b2 (make-branch 1 4))
(define b3 (make-branch 7 6))
(define m1 (make-mobile b b1))
(define m2 (make-mobile b2 b3))
(define b5 (make-branch 3 m2))
(define m3 (make-mobile b2 b1))
(define m0 (make-mobile b1 b5))

(define b4 (make-branch 2 m3))

(check-expect (branch-length b) 1)
(check-expect (branch-structure b) 2)

(define m (make-mobile 1 2))

(check-expect (left-branch m) 1)
(check-expect (right-branch m) 2)

(check-expect (total-weight m1) 5)
(check-expect (total-weight m0) 13)

(define b6 (make-mobile 1 2))
(define b7 (make-mobile 2 1))

(check-expect (balanced? (make-mobile b6 b7)) #t)
(check-expect (balanced? (make-mobile b1 b7)) #f)

(test)
