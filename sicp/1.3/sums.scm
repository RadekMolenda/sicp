#lang scheme

(provide sum-integers
         sum-cubes
         sum
         my-apply
         inc
         sum-cubes-2
         identity
         sum-integers2)

(define (sum-integers2 a b)
  (sum identity a inc b))

(define (identity x) x)

(define (sum-integers a b)
  (if (> a b)
    0
    (+ a (sum-integers (+ a 1) b))))

(define (cube x) (* x x x))

(define (sum-cubes a b)
  (if (> a b)
    0
    (+ (cube a) (sum-cubes (+ a 1) b))))


(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (my-apply f el)
  (f el))

(define (inc n) (+ n 1))

(define (sum-cubes-2 a b)
  (sum cube a inc b))
