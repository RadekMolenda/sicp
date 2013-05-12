#lang scheme

(define (square n)
  (* n n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (let ((x (expmod base (/ exp 2) m)))
           (if (or (= 1 x) (= exp x))
            (remainder (square x) m)
            0)))
        (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (test n)
  (define (try-it a)
    (let (x (expmod a n n))
      (if (= x a)
          
      (= x a))
  (try-it (+ 1 (random (- n 1)))))
