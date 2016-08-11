#lang racket

(define dx 0.1 )
(define (inc x) (+ x 0.1))

(define (smooth input-proc)
  (lambda (x)
    (/ (+ (input-proc (- x dx)) (input-proc x) (input-proc (+ x dx))) 3)
    )
)
  

(define (compose proc1 proc2)
  (lambda (x)
    (proc1 (proc2 x)))
  )

(define (repeated-combine proc n result)
  (if (= n 1)
  result
  (repeated-combine proc (- n 1) (compose proc result))
  ))



(((repeated-combine smooth 2 smooth) inc) 3)