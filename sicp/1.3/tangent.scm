#lang scheme

(provide tan-cf
         tan-cf-raw)
(require "continued-fraction.scm")

(define (tan-cf x k)
  (define (n a) (if (= a 1) x (- 0 (* x x))))
  (define (d a) (- (* 2 a) 1))
  (cont-frac-i n d k))

(define (tan-cf-raw x k)
  (define (n a) (if (= a 1) x (- 0 (* x x))))
  (define (iter a acc)
    (if (= a 0)
      acc
      (iter (- a 1) (/ (n a) (+ (- (* 2 a) 1) acc)))))
  (iter k (/ (n k) (- (* 2 k) 1))))

