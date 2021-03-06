#lang racket

(define (good guess x)
  (< (abs (- x (* guess guess guess))) 0.0001)
 )

(define (improve guess x) (cuberoot (/ (+ (* 2 guess) (/ x (* guess guess))) 3) x))


(define (cuberoot guess x)
  (if (good guess x)
       guess
       (improve guess x)
    )
  )


(cuberoot 1 26.99999)