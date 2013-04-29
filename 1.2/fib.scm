#lang scheme

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q)) ; calculate q
                   (+ (* 2 p q) (* q q)) ; calculate p
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))



(display (fib 0)) ; => 0
(display "\n")
(display (fib 1)) ; => 1
(display "\n")
(display (fib 2)) ; => 1
(display "\n")
(display (fib 3)) ; => 2
(display "\n")
(display (fib 4)) ; => 3
(display "\n")
(display (fib 5)) ; => 5
(display "\n")
(display (fib 6)) ; => 8
(display "\n")
(display (fib 7)) ; => 13
(display "\n")
(display (fib 8)) ; => 21
(display "\n")
(display (fib 9)) ; => 34
(display "\n")
(display (fib 10)) ; => 55
(display "\n")
(display (fib 11)) ; => 21
(display "\n")
(display (fib 12)) ; => 21
(display "\n")
(display (fib 13)) ; => 21
(display "\n")
(display (fib 14)) ; => 21
(display (fib 1000000)) ; => 21
