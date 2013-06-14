#lang scheme

(require "sums.scm")

(provide integral)

(define (integral f a b n)
  (let*
    ((h (/ (- b a) n))
    (inc (lambda (x) (+ x 1)))
    (transform (lambda (i)
      (cond
        ((= i 0) (f a))
        ((= i n) (f (+ a (* i h))))
        ((even? i) (* 2 (f (+ a (* i h)))))
        ((odd? i) (* 4 (f (+ a (* i h)))))))))
  (* (/ h 3) (sum transform 0 inc n))))
