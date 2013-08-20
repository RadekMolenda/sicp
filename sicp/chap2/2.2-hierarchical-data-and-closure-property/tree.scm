#lang scheme

(provide fringe
         deep-reverse
         reverse
         make-mobile
         make-branch
         left-branch
         right-branch
         branch-length
         branch-structure
         total-weight
         balanced?)

(define (list-with-two-elements l r) (cons l r))

(define make-mobile list-with-two-elements)
(define make-branch list-with-two-elements)

(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cdr mobile))

(define (branch-length branch) (car branch))
(define (branch-structure branch) (cdr branch))

(define (fringe tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (list tree))
        (else (append (fringe (car tree)) (fringe (cdr tree))))))

(define (reverse coll)
  (define (iter acc coll)
    (if (null? coll)
      acc
      (iter (cons (car coll) acc) (cdr coll))))
  (iter '() coll))

(define (deep-reverse coll)
  (define (iter acc coll)
    (if (null? coll)
      acc
      (let ((head (car coll))
            (tail (cdr coll)))
        (if (pair? head)
          (iter (cons (deep-reverse head) acc) tail)
          (iter (cons head acc) tail)))))
  (iter '() coll))


(define (total-weight mobile)
  (define (weight total-weight branch)
    (let ((structure (branch-structure branch)))
      (if (pair? structure)
        (total-weight structure)
        structure)))
  (+ (weight total-weight (left-branch mobile))
     (weight total-weight (right-branch mobile))))

(define (balanced? mobile)
  (define (torque branch)
    (let ((structure (branch-structure branch))
          (len (branch-length branch)))
      (if (pair? structure)
        (* len (total-weight structure))
        (* len structure))))
  (= (torque (left-branch mobile))
     (torque (right-branch mobile))))
