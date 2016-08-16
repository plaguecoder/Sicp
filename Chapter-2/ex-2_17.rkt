#lang scheme

(define list1 (list 1 2 3 4 5 66))

(define (last-pair list2)
  (if (null? (cdr list2))
      list2
      (last-pair (cdr list2))
      )
  )

(last-pair list1)