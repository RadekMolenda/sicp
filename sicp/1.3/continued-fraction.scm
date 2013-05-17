#lang scheme

(provide cont-frac
         cont-frac-i)

(define (cont-frac n d k)
  (define (y a)
    (if (= a k)
      (/ (n a) (d a))
      (let ((next (+ a 1)))
        (/ (n a) (+ (d a) (y next))))))
  (y 1))

(define (cont-frac-i n d k)
  (define (y a acc)
    (if (= a 0)
      acc
      (let ((next (- a 1)))
        (y next (/ (n a) (+ (d a) acc))))))
  (y k (/ (n k) (d k))))
