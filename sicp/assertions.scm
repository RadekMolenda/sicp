(define (assert x msg)
  (if (not x) (begin
                (display "Failed: ")
                (display msg)
                (newline))
    (display ".")))
