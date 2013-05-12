#lang scheme

(provide product
         producti)

(define (product term a next b)
  (if (> a b)
    1
    (* (term a) (product term (next a) next b))))

(define (producti term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* (term a) result))))
  (iter a 1))
