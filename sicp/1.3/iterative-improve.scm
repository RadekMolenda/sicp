#lang scheme

(provide iterative-improve
         fixed-point
         my-sqrt)

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (let ((next (improve guess)))
      (if (good-enough? guess next)
        next
        ((iterative-improve good-enough? improve) next)))))


(define (close-enough? v1 v2)
  (< (abs(- v1 v2)) 0.0001))

(define (fixed-point f first-guess)
  ((iterative-improve close-enough? f) first-guess))

(define (avg x y) (/ (+ x y) 2))

(define (my-sqrt n)
  (define (improve guess)
    (avg guess (/ n guess)))
  ((iterative-improve close-enough? improve) 1.0))

