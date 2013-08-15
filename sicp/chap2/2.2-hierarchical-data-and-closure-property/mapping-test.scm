#lang scheme

(require "mapping.scm")
(require test-engine/racket-tests)

(check-expect (square-list '(1 2 3 4)) '(1 4 9 16))
(check-expect (square-list-map '(1 2 3 4)) '(1 4 9 16))


(test)
