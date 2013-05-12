;Hello World!
(load-relative "assertions.scm")

(begin
  (display "Hello World!")
  (newline))

(display
  (+
    4
    (*
      5
      6)))

(define size 5)
(newline)
(display size)
(newline)

(define x (lambda (a)
            (begin
              (display (+ 3 a))
              (newline)
              (display "Hello World!"))))

(define (my-abs x)
  (cond
    ((< x 0) (- x))
    ((= x 0) 0)
    ((> x 0) x)))

(define (my-abs1 x)
  (if (< x 0) (- x) x))

(define (my-abs2 x)
  (or
    (and
      (< x 0)
      (- x))
    x))

(define (square x) (* x x))
(define (ss x y) (+ (square x) (square y)))
(define (square-sum-of-largest x y z)
  (cond
    ((and (> y z) (> x y)) (ss x y))
    ((and (> z y) (> x y)) (ss x z))
    (else (ss y z))))




(define (sqrt x)
  (define (average x y) (/ (+ x y) 2))
  (define (improve guess) (average guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs (/ (- (square guess) x) (square guess))) 0.001))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
      guess
      (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))


(define (cubert-iter guess x)
  (if (good-enough-cube? guess x)
    guess
    (cubert-iter (improve-cube guess x)
                 x)))

(define (cube-root x)
  (cubert-iter 1.0 x))

(define (good-enough-cube? guess x)
    (< (abs (/ (- (* guess guess guess) x) (* guess guess guess))) 0.001))

(define (improve-cube guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(display (improve-cube 1 4))
(assert (good-enough-cube? 2 8) "good-enough-cube? should be true for 2 8")
(assert (= (improve-cube 1 1) 1) "improve-cube 1 2 should eq 1")
(assert (= (improve-cube 1 4) 2) "improve-cube 1 4 should eq 2")

(display (cube-root 8))
(display (cube-root 27))


