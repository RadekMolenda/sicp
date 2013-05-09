#lang scheme

(require "sums.scm")

(provide integral)

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (inc x) (+ x 1))
  (define (transform i)
    (cond
      ((= i 0) (f a))
      ((= i n) (f (+ a (* i h))))
      ((even? i) (* 2 (f (+ a (* i h)))))
      ((odd? i) (* 4 (f (+ a (* i h)))))))
  (* (/ h 3) (sum transform 0 inc n)))

