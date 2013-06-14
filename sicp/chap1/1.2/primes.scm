; 1.2.6

#lang scheme

(provide (all-defined-out))
(define (next n)
  (if (= n 2) 3
    (+ n 2)))

(define (square n)
  (* n n))
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(display (prime? 3))
(newline)

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

(define (runtime) (current-inexact-milliseconds))
; ex 1.21
(display (smallest-divisor 199))
(newline)
(display (smallest-divisor 1999))
(newline)
(display (smallest-divisor 19999))
(newline)
; ex 1.22

(define (time-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
    (report-prime (- (runtime) start-time)) 0))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start end)
  (time-prime-test start)
  (cond ((> start end) 0)
        ((even? start) (search-for-primes (+ start 1) end))
        (else (search-for-primes (+ start 2) end))))

(search-for-primes 1000 1018)
;(search-for-primes 10000 10036)
;(search-for-primes 100000 100045)
;(search-for-primes 1000000 1000036)

; ex 1.27
(display "ex 1.27")
(newline)
(newline)

(define (check n)
  (define (try a)
    (if (= (expmod a n n) a)
      (try (- a 1))
      (begin (display a) (display " ") (display (expmod a n n)) (newline))))
  (try n))

(define carmichael '(561 1105 1729 2465 2821 6601))

(define (test-carmichael xs)
  (if (null? xs)
    0
    (begin (check (car xs)) (test-carmichael (cdr xs)))))

(test-carmichael carmichael)
; (2 2 2)
;(remainder (square (expmod 2 1 2)) 2)
;(remainder (square (remainder (* 2 (expmod 2 0 2) 2))))
;(remainder (square (remainder (* 2 1) 2)) 2)
;(remainder (square 0) 2)
;0
