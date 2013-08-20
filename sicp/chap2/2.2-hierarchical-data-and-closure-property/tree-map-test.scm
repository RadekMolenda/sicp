#lang scheme

(require "tree-map.scm")
(require test-engine/racket-tests)

(define tree '(1 (2 (3 4) 5) (6 7)))
(check-expect (square-tree tree) '(1 (4 (9 16) 25) (36 49)))
(check-expect (square-tree-m tree) '(1 (4 (9 16) 25) (36 49)))
(check-expect (square-tree-with-tree-map tree) '(1 (4 (9 16) 25) (36 49)))

(test)
