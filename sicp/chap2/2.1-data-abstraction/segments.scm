#lang scheme

(provide make-point
         x-point
         y-point
         make-segment
         start-point
         end-point
         mid-point
         make-rectangle
         p1-rectangle
         p2-rectangle
         perimeter
         area)

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (make-segment a b) (cons a b))
(define (start-point segment) (car segment))
(define (end-point segment) (cdr segment))

(define (middle-point a b)
  (define (middle x y)
    (/ (+ x y) 2))
  (make-point
    (middle (x-point a) (x-point b))
    (middle (y-point a) (y-point b))))

(define (mid-point segment)
  (middle-point
    (start-point segment)
    (end-point segment)))

(define (make-rectangle p1 p2) (cons p1 p2))

(define (p1-rectangle rectangle) (car rectangle))
(define (p2-rectangle rectangle) (cdr rectangle))


(define (len f rectangle)
  (let ((p1 (p1-rectangle rectangle))
        (p2 (p2-rectangle rectangle)))
    (abs (- (f p1) (f p2)))))

(define width (lambda (x) (len x-point x)))
(define height (lambda (x) (len y-point x)))

(define (perimeter rectangle)
  (+ (* 2 (width rectangle))
     (* 2 (height rectangle))))

(define (area rectangle)
  (* (width rectangle)
     (height rectangle)))
