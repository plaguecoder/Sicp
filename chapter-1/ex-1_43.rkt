#lang racket

(define (compose proc1 proc2)
  (lambda (x)
    (proc1 (proc2 x)))
  )

(define (repeated-combine proc n result)
  (if (= n 1)
  result
  (repeated-combine proc (- n 1) (compose proc result))
  ))
  

(define (inc x) (+ x 1))

((repeated-combine inc 3 inc) 3)