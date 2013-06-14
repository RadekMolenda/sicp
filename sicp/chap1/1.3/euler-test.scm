#lang scheme

(require test-engine/racket-tests)

(require "euler.scm")


(check-within euler 0.71828 0.0001)
(check-within euler-i 0.71828 0.0001)

(check-expect (d 1) 1)
(check-expect (d 2) 2)
(check-expect (d 3) 1)
(check-expect (d 4) 1)
(check-expect (d 5) 4)
(check-expect (d 6) 1)
(check-expect (d 7) 1)
(check-expect (d 8) 6)

(test)

