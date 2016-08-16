#lang scheme

(define l1 (list 1 2 3 4 5 6 7 8 9))
(define reversed (list ))

(define (reverse l reversed)
  (if (null? (cdr l))
      reversed
      (reverse (cdr l) (cons (car l) reversed))
      )
  )

(reverse l1 reversed)