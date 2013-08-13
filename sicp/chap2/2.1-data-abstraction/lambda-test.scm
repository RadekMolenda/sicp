#lang scheme

(require "lambda.scm")
(require test-engine/racket-tests)

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (sum a b) (lambda (f) (lambda (x) ((b f) ((a f) x)))))

(define (to_integer x)
  ((x (lambda (y) (+ y 1))) 0))

(check-expect (the-car (the-cons 1 2)) 1)
(check-expect (the-cdr (the-cons 1 2)) 2)
(check-expect (ar-car (ar-cons 1 2)) 1)
(check-expect (ar-cdr (ar-cons 1 2)) 2)

(check-expect (to_integer zero) 0)
(check-expect (to_integer one) 1)
(check-expect (to_integer two) 2)
(check-expect (to_integer (add-1 two)) 3)
(check-expect (to_integer (sum two one)) 3)
(check-expect (to_integer (sum two two)) 4)


(test)
