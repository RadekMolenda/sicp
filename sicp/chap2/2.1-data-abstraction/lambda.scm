#lang scheme

(provide the-cons
         the-car
         the-cdr
         ar-cons
         ar-car
         ar-cdr)

(define (the-cons x y)
  (lambda (m) (m x y)))

(define (the-car z)
  (z (lambda (p q) p)))

(define (the-cdr z)
  (z (lambda (p q) q)))


(define (ar-cons x y)
  (* (expt 2 x)
     (expt 3 y)))

(define (iter acc calc n)
  (if (= (remainder calc n) 0)
    (iter (+ 1 acc)
          (quotient calc n)
          n)
    acc))
(define (ar-car z)
  (iter 0 z 2))

(define (ar-cdr z)
  (iter 0 z 3))
