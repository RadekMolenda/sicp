#lang racket

(provide accumulate
         map
         append
         length
         horner-eval
         count-leaves
         enumerate-tree
         accumulate-n
         dot-product
         map*
         matrix-*-vector
         transpose
         matrix-*-matrix
         foldl
         reversel
         reverser)

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coef higher-therms) (+ (* higher-therms x) this-coef))
              0
              coefficient-sequence))

(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define (count-leaves tree)
  (accumulate + 0 (map (lambda (_) 1) (enumerate-tree tree))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    '()
    (cons (accumulate op init (map car seqs))
          (accumulate-n op init (map cdr seqs)))))

(define (map* f . colls)
  (define (some-null? colls)
    (accumulate (lambda (x y) (or (null? x) y)) #f colls))
  (if (some-null? colls)
    '()
    (cons (apply f (map car colls))
          (apply map* (cons f (map cdr colls))))))

(define (dot-product v w)
  (accumulate + 0 (map* * v w)))

(define (matrix-*-vector m v)
  (map (lambda (coll) (dot-product coll v)) m))

(define (transpose m)
  (accumulate-n cons '() m))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (coll) (matrix-*-vector cols coll)) m)))

(define (foldl op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest))
            (cdr rest))))
  (iter initial sequence))

(define foldr accumulate)

(define (reversel seq)
  (foldl (lambda (x y) (cons y x)) '() seq))

(define (reverser seq)
  (foldr (lambda (x y) (append y (list x))) '() seq))
