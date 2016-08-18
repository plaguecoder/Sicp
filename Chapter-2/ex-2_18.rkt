#lang scheme

(define l1 (list 1 2 3 4 5 6 7 8 9))
(define reversed (list ))

(define (reverse l)
  (define (iter l result)
  (if (null? (cdr l))
      (cons (car l) result)
      (iter (cdr l) (cons (car l) result))
      )
  )
  (iter l null)
  )

(reverse l1)
