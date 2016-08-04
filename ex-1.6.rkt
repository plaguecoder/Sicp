#lang racket

(define (good guess x)
  (< (abs (- x (* guess guess))) 0.01)
 )


(define (improve guess x) (sqrt (/ (+ guess (/ x guess)) 2) x))


(define (new-if predicate then-clause x)
  (cond (predicate then-clause)
        (else (improve then-clause x))))


(define (sqrt guess x)
  (new-if (good guess x)
          guess
          x))





(sqrt 1 15)