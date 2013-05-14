#lang scheme

(provide cont-frac
         cont-frac-i)

(define (cont-frac n d k)
  (define (y a)
    (if (= a k)
      (/ (n a) (d a))
      (let ((next (+ a 1)))
        (/ (n next) (+ (d next) (y next))))))
  (y 1))

(define (cont-frac-i n d k)
  (define (y a acc)
    (if (= a k)
      acc
      (let ((next (+ a 1)))
        (y next (/ (n next) (+ (d next) acc))))))
  (y 1 (/ (n k) (d k))))
