#lang scheme

(require "nested-mapping.scm")
(require test-engine/racket-tests)

(check-expect (enumerate-interval 1 10) '(1 2 3 4 5 6 7 8 9 10))

(check-expect (prime-sum? (list 1 3)) #f)
(check-expect (prime-sum? (list 1 6)) #t)

(check-expect (flatmap (lambda (x) x) '((1 2) (3 4))) '(1 2 3 4))

(check-expect (prime-sum-pairs 4) '((2 1 3) (3 2 5) (4 1 5) (4 3 7)))

(check-expect (perms '(1 2 3)) '((1 2 3)
                                 (1 3 2)
                                 (2 1 3)
                                 (2 3 1)
                                 (3 1 2)
                                 (3 2 1)))
(test)
