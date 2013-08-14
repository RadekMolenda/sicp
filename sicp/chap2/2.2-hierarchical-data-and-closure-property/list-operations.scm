#lang scheme

(provide lst-pair
         rvrs
         cc
         us-coins
         uk-coins
         same-parity)

(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (lst-pair l)
  (if (null? (cdr l))
    l
    (lst-pair (cdr l))))

(define (rvrs l)
  (define (iter acc l)
    (if (null? l)
      acc
      (iter (cons (car l) acc) (cdr l))))
  (iter '() l))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (cc amount
                 (except-first-denomination coin-values))
             (cc (- amount
                    (first-denomination coin-values))
                 coin-values)))))

(define no-more? null?)
(define except-first-denomination cdr)
(define first-denomination car)

(define (same-parity x . xs)
  (if (odd? x)
    (cons x (filter odd? xs))
    (cons x (filter even? xs))))
