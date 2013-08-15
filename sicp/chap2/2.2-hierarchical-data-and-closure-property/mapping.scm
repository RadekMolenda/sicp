#lang scheme

(provide square-list
         square-list-map
         for-each)

(define (for-each f coll)
  (if (null? coll)
    #t
   (begin (f (car coll)) (for-each f (cdr coll)))))

(define (square-list coll)
  (if (null? coll)
    '()
    (cons (expt (car coll) 2) (square-list (cdr coll)))))

(define (square-list-map coll)
  (map (lambda (x) (expt x 2)) coll))

(for-each display '(1 2 3 4))


