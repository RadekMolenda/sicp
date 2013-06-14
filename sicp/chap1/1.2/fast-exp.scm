#lang scheme

(define (square n) (* n n))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

; (fast-expt 3 5)
; (* 3 (fast-expt 3 4))
; (* 3 (square (fast-expt 3 2)))
; (* 3 (square (square (fast-expt 3 1))))
; (* 3 (square (square (* 3 (fast-expt 3 0)))))
; (* 3 (square (square (* 3 1))))
; (* 3 (square (square 3)))
; (* 3 (square 9))
; (* 3 81)


(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (square b) (/ n 2) a))
        (else (fast-expt-iter b (- n 1) (* b a)))))

; 2 16 1
; 4 8  4
; 2 4  16
; 2 2  
;
; 
; (fast-expt-iter 2 8 1)
; (fast-expt-iter 4 4 1)
; (fast-expt-iter 16 2 1)
; (fast-expt-iter 256 1 1)
;
; (fast-expt-iter 3 4 1)
; (fast-expt-iter 3 2 9)
; (fast-expt-iter 3 1 81)
;
(define (fast-expt-i b n)
  (fast-expt-iter b n 1))

(display (fast-expt 2 10))
(display "\n")
(display (fast-expt-i 2 8))
(display "\n")
(display (fast-expt-i 3 5))

