#lang scheme

(define (square-list items)
  (if (null? items)
null
(cons (* (car items) (car items)) (square-list (cdr items)))))

(square-list (list 1 2 3 4 5 6 7))

(define (square-list1 items)
(map (lambda (x) (* x x)) items))

(square-list1 (list 1 2 3 4 5 6 7))