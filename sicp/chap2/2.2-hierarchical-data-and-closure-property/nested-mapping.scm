#lang scheme

(require "sequence-operations.scm")
(require math/number-theory)

(provide enumerate-interval
         prime-sum?
         flatmap
         prime-sum-pairs
         perms
         unique-pairs
         sums-to?
         unique-triplets)


(define (enumerate-interval s n)
  (define (iter acc n)
    (if (<= n 0)
      acc
      (iter (cons n acc) (- n s))))
  (iter '() n))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))


(define (rem item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence))

(define (perms s)
  (if (null? s)
    (list '())
    (flatmap (lambda (x)
               (map (lambda (p) (cons x p))
                    (perms (rem x s))))
             s)))

(define (unique-pairs n)
  (flatmap
    (lambda (i)
      (map (lambda (j) (list i j))
           (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))

(define (unique-triplets n)
  (flatmap
    (lambda (i)
      (flatmap
        (lambda (j)
          (map (lambda (k) (list i j k))
               (enumerate-interval 1 (- j 1))))
        (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))

(define (sums-to? s xs)
  (if (null? xs)
    #f
    (= s (accumulate + 0 xs))))

(define (find-triplets s n)
  (define sums-to-s?
    (lambda (xs)
      (sums-to? s xs)))
  (filter sums-to-s?
          (unique-triplets n)))
