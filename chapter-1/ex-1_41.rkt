#lang racket

(define (double sec-proc)
  (lambda (x)
    (sec-proc (sec-proc x))
    )
  )

(define (inc x) (+ x 1))

(((double (double double)) inc) 5)