#lang scheme

(provide filtered-accumulate
         sum-prime-squares)

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))


(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (filtered-accumulate filter combiner null-value term a next b)
  (define filtered
    (if (filter a)
      (term a)
      null-value))
  (if (> a b)
    null-value
    (combiner filtered (filtered-accumulate filter
                                            combiner
                                            null-value
                                            term
                                            (next a)
                                            next b))))

(define (prime? n)
  (fast-prime? n 100))

(define (sum-prime-squares a b)
  (filtered-accumulate prime? + 0 (lambda (x) (* x x)) a (lambda (x) (+ x 1)) b))
