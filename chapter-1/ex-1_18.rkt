#lang racket

;recursive multiplication

(define (double a) (+ a a))
(define (halve b) (/ b 2))

(define (iter-mult a b c)
  (if (= b 0) c
  (if (= (remainder b 2) 0)
  (iter-mult (double a) (halve b) c) 
  (iter-mult a (- b 1) (+ a c))
  )
  )
  )

(iter-mult 0 3 0)