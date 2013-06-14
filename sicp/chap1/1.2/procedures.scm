#lang scheme
;factorial
;

(define (print msg)
  (begin
    (display msg)
    (newline)))
(define (factorial n)
  (if (= n 1)
    1
    (* n (factorial (- n 1)))))


(define (fact1 n)
  (define (fact-iter product counter)
    (if (> counter n)
        product
      (fact-iter (* product counter)
                 (+ 1 counter))))
  (fact-iter 1 1))



;Ex 1.9
;(+ 4 5)
;(inc (+ 3 5))
;(inc (inc (+ 2 5)))
;(inc (inc (inc (+ 1 5))))
;(inc (inc (inc (inc (+ 0 5)))))
;(inc (inc (inc (inc 5))))
;(inc (inc (inc 6)))
;(inc (inc 7))
;(inc 8)
;9
;
;b)
;(+ 4 5)
;(+ (dec 4) (inc 5))
;(+ 3 6)
;(+ (dec 3) (inc 6))
;(+ 2 7)
;(+ (dec 2) (inc 7))
;(+ 1 8)
;(+ (dec 1) (inc 8))
;(+ 0 9)
;9
;Ex 1.10
;(A 1 10) = 1024
;(A 0 (A 1 9))
;(A 0 (A 0 (A 1 8)))
;(A 0 (A 0 (A 0 (A 1 7))))
;(A 0 (A 0 (A 0 (A 0 (A 0 ...(A 1 1))))))
;(A 0 (A 0 (...(A 0 2)...)))
;(A 2 4) = 2 ^ 16
;(A 1 (A 2 3))
;(A 1 (A 1 (A 2 2)))
;(A 1 (A 1 (A 1 (A 2 1))))
;(A 1 (A 1 (A 1 2)))
;(A 1 (A 1 (A 0 (A 1 1))))
;(A 1 (A 1 (A 0 2)))
;(A 1 (A 1 4))
;(A 1 (A 0 (A 1 3))
;(A 1 16)
;(A 2 5)
;(A 1 (A 1 (A 1 (A 1 2))))
;(A 3 3)
;(A 2 (A 3 2))
;(A 2 (A 2 (A 3 1)))
;(A 2 (A 2 2))
;(A 2 (A 1 (A 2 1))
;(A 2 (A 1 2))
;(A 2 (A 0 (A 1 1))
;(A 2 (A 0 2))
;(A 2 4) = 2 ^ 16
;
(define (A x y)
  (cond
    ((= y 0) 0)
    ((= x 0) (* 2 y))
    ((= y 1) 2)
    (else (A (- x 1)
             (A x (- y 1))))))


;(A 0 n) computes 2n
;(A 1 n) computes 2^n
;(A 2 n) computes 2^(n^2)
;
;Fibonacci
(define (fib n)
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    (else (+ (fib (- n 1))
             (fib (- n 2))))))


(define (fibi n)
  (define (fib-iter a b count)
    (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))

;(f 4)
;1(fib-iter 1 0)
;2(fib-iter 1 1)
;3(fib-iter 2 1)
;4(fib-iter 3 2)
;5(fib-iter 5 3)
;6(fib-iter 8 5)
;7(fib-iter 13 8)
;8(fib-iter 21 13)
;9  34 21
;10 55 34
;11 89 55
;12 144 89
;13 233 144
;14 377 233
;15 610 377
;16 987 610

(print (fibi 1000000))

;Ex. 1.11
(define (f n)
  (cond
   ((= n 0) 0)
   ((= n 1) 1)
   ((= n 2) 2)
   (else (+ (f (- n 1))
            (f (* 2 (- n 2)))
            (f (* 3 (- n 3)))))))

(define (f1 n)
  (define (f1-iter a b c count)
     (if (= count 0)
         c
         (f1-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
  (f1-iter 2 1 0 n))
;
;(f1-iter 2 1 0)
;(f1-iter 4 2 1)
;(f1-iter 11 4 2)
;(f1-iter 21 11 4)
;; ;(f1-iter 53 19 11)
;; (check-expect (f1 0) 0)
;; (check-expect (f1 1) 1)
;; (check-expect (f1 2) 2)
;; (check-expect (f1 3) 4)
;; (check-expect (f1 4) 11)

(define (pascal n)
  (letrec ((simple (lambda (xs)
    (if (= (length xs) 1)
        '(1)
        (cons (+ (car xs) (car (cdr xs))) (simple (cdr xs)))))))
  (cond
   ((= n 0) '(1))
   ((= n 1) '(1 1))
   (else
    (cons 1 (simple (pascal (- n 1))))))))

;; (check-expect (pascal 2) '(1 2 1))
;; (check-expect (pascal 3) '(1 3 3 1))
;; (check-expect (pascal 4) '(1 4 6 4 1))
;; (check-expect (pascal 5) '(1 5 10 10 5 1))

; 1 0 0 1 2
; 1 0 1 1 1
; _ 1 1 2 0
;;
; fibf-iter 1 0 0 1 5
; fibf-iter 1 1 0 1 4
; fibf-iter 1 1 1 2 2
; fibf-iter 1 1 3 5 1
; fibf-iter _ 8 3 5 0
;; (check-expect (fibi 3) (fibf 3))
;; (check-expect (fibi 5) (fibf 5))
;; (check-expect (fibi 7) (fibf 7))
;; (test)
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

(define (expti b n)
  (define (expt-iter a n)
    (if (= n 0)
        a
        (expt-iter (* a b) (- n 1))))
  (expt-iter 1 n))

(define (square n)
  (* n n))

(define (fast-exp b n)
  (define (even?)
    (= (remainder n 2) 0))
  (cond ((= n 0) 1)
        ((even?) (square (fast-exp b (/ n 2))))
        (else (* b (fast-exp b (- n 1))))))

(print (square 10))

