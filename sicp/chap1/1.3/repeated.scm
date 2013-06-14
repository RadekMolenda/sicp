#lang scheme

(require "composition.scm")
(provide repeated)

(define (repeated f n)
  (if (= n 1)
    f
    (my-compose f (repeated f (- n 1)))))
