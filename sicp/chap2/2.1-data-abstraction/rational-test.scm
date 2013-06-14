aang scheme

(require "rational.scm")
(require test-engine/racket-tests)

(define x (make-rat 1 2))
(define y (make-rat 2 3))

(check-expect (add-rat x y) (make-rat 7 6))
(check-expect (sub-rat y x) (make-rat 1 6))
(check-expect (mul-rat y x) (make-rat 2 6))
(check-expect (div-rat x y) (make-rat 3 4))
(check-expect (equal-rat? x x) #t)
(check-expect (equal-rat? x y) #f)
(check-expect (make-rat -1 -2) (make-rat 1 2))
(check-expect (make-rat 1 -2) (make-rat -1 2))

(test)
