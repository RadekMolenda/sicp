#lang scheme

(provide product
         producti
         factorial
         pi/4)

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

(define (factorial n)
  (product (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

(define (pi/4 n)
  (let ((transform
        (lambda (t)
          (cond ((even? t) (/ t (+ t 1)))
                ((odd? t) (/ (+ t 1) t))))))
    (product transform 2 (lambda (x) (+ x 1)) n)))
