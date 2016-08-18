#lang racket

(define (for-each f l)
  (if (null? (cdr l))
      (f (car l))
      (begin
        (f (car l))
      (for-each f (cdr l))
      )
      )
  )

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))