#lang scheme

(require "list-operations.scm")
(require test-engine/racket-tests)


(check-expect (lst-pair (list 1 2 3 4)) '(4))
(check-expect (rvrs (list 1 2 3 4)) '(4 3 2 1))

(check-expect (cc 100 us-coins) 292)

(check-expect (same-parity 1 2 3 4 5 6 7) '(1 3 5 7))
(check-expect (same-parity 2 3 4 5 6 7) '(2 4 6))

(test)
