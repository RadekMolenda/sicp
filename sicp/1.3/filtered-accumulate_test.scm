#lang scheme
(require "filtered-accumulate.scm")

(require test-engine/racket-tests)

(check-expect (filtered-accumulate even? + 0 (lambda (x) x) 1 (lambda (x) (+ x 1)) 5) 6)
(check-expect (filtered-accumulate odd? + 0 (lambda (x) x) 1 (lambda (x) (+ x 1)) 5) 9)

(check-expect (sum-prime-squares 3 6) (+ 9 25))
(check-expect (sum-prime-squares 3 7) (+ 9 25 49))
(check-expect (sum-prime-squares 3 9) (+ 9 25 49))

(check-expect (relative-primes? 3 7) #t)
(check-expect (relative-primes? 7 18) #t)
(check-expect (relative-primes? 6 18) #f)

(check-expect (relative-primes-product 5) 24)
(check-expect (relative-primes-product 6) 5)
(check-expect (relative-primes-product 7) 720)
(test)
