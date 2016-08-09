#lang racket

(define (square z) (* z z))

(define (expmod a exp n)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod a (/ exp 2) n)) n))
        (else (remainder (* a (expmod a (- exp 1) n)) n))
   ))

(define (try-it a n)
    (= (expmod a n n) a))

(define (carmichael-test n)
  (try-it (+ 1 (random (- n 1))) n)
  ) 

(define (fast-prime? n times)
  (cond ((= times 0) display"true")
        ((carmichael-test n) (fast-prime? n (- times 1)))
        (else display"false")))

(fast-prime? 6 100000)