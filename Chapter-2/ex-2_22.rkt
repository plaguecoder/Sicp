#lang scheme

(define (square a) (* a a))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items null))

(square-list (list 1 2 3 4 5 6))
#|
values are in reverse, this is so because first value is dealth with first and
then it goes to the end of list being created 
|#

(define (square-list1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer (square (car things))
                    ))))
  (iter items null))

(square-list1 (list 1 2 3 4 5 6))

#|
Here the order of values are ok but everytime the car part being added is already
a list therefore we get answer as (list (list (list .....
|#