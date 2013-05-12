#lang scheme

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (* a b)
  (if (= b 0)
    0
    (+ a (* a (- b 1)))))

(define (fast-* a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-* a (halve b))))
        (else (+ a (fast-* a (- b 1))))))

(define (fast-*-iter a b x)
  (cond ((= b 0) x)
        ((even? b) (fast-*-iter
                     (double a)
                     (halve b)
                     x))
        (else (fast-*-iter
                a
                (- b 1)
                (+ a x)))))

(define (fast-*-i a b)
  (fast-*-iter a b 0))

(display (fast-*-i 8 9))
