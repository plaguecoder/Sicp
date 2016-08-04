#lang racket

(define (good guess x)
  (< (abs (- x (* guess guess))) 0.01)
 )

(define (improve guess x) (sqrt (/ (+ guess (/ x guess)) 2) x))


(define (sqrt guess x)
  (if (good guess x)
       guess
       (improve guess x)
    )
  )


(sqrt 1 48)