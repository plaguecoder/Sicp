#lang scheme

(define (compose proc1 proc2)
  (lambda (x)
    (proc1 (proc2 x)))
  )

(define (square x) (* x x))
(define (inc x) (+ x 1))

((compose inc square ) 2)