#lang scheme

(provide add-rat
         sub-rat
         mul-rat
         div-rat
         equal-rat?
         make-rat)

(define (make-rat x y)
  (let ((g (gcd x y)))
    (cond
      ((and (> x 0) (> y 0))
       (cons (/ x g) (/ y g)))
      ((or (and (< x 0) (< y 0)) (< y 0))
       (cons (/ (- 0 x) g) (/ (- 0 y) g)))
      (else
       (cons (/ x g) (/ y g))))))

(define (numer x) (car x))
(define (denom x) (cdr x))


(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom y) (denom x))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom y) (denom x))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (denom x) (numer y))))
