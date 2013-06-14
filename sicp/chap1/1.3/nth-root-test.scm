#lang scheme

(require "nth-root.scm")
(require test-engine/racket-tests)

(check-within (nth-root 2 4.0) 2.0 0.001)
(check-within (nth-root 2 9.0) 3.0 0.001)
(check-within (nth-root 3 8.0) 2.0 0.001)
(check-within (nth-root 4 16.0) 2.0 0.001)
(check-within (nth-root 5 32.0) 2.0 0.001)
(check-within (nth-root 10 1024.0) 2.0 0.001)


(test)
