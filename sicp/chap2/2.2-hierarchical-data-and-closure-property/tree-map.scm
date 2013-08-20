#lang scheme

(provide tree-map
         square-tree
         square-tree-m
         square-tree-with-tree-map
         subsets)

(define (square-tree tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(define (square-tree-m tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (square-tree-m sub-tree)
           (* sub-tree sub-tree)))
       tree))

(define (tree-map f tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
           (square-tree-m sub-tree)
           (f sub-tree)))
       tree))

(define (square x) (* x x))

(define (square-tree-with-tree-map tree) (tree-map square tree))

(define (subsets s)
  (if (null? s)
    (list '())
    (let ((rest (subsets (cdr s))))
      (append rest (map (lambda (x) (remove* x s)) rest)))))
