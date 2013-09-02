#lang scheme

(require "sequence-operations.scm")
(require math/number-theory)

(provide enumerate-interval
         prime-sum?
         flatmap
         prime-sum-pairs
         perms)


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
               (flatmap
                 (lambda (i)
                   (map (lambda (j) (list i j))
                        (enumerate-interval 1 (- i 1))))
                 (enumerate-interval 1 n)))))

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

