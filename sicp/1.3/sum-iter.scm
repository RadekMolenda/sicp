#lang scheme

(provide sum)

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (+ a 1) (+ (term a) result))))
  (iter a 0))
