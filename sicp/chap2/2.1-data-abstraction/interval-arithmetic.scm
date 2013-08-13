#lang scheme

(provide add-interval
         mul-interval
         div-interval
         make-interval
         lower-bound
         upper-bound)

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
;[1 2] 0.5
;[5 11] 3
;* [5 22] 8.5

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (let ((u (upper-bound y))
        (l (lower-bound y)))
    (if (< (+ u l) (abs (- u l)))
      (error "y spans zero")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y)))))))


;[1.53 1.73] 0.1
;[1.04 1.14] 0.05
;[0.49 0.59] 0.05
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

(define (width i) (/ (- (upper-bound i) (lower-bound i)) 2.0))

(define make-interval cons)
(define (upper-bound interval) (max (car interval) (cdr interval)))
(define (lower-bound interval) (min (car interval) (cdr interval)))
