#lang racket

(define (square x)(* x x))

(define (square-with-check x m)
  (if(and (= 1 (remainder (square x) m)) (not(= x 1)) (not(= x (- m 1))))
  0
  (square x)
  ))

(define (check-it x) 
       (and (not(= x 0)) (= x 1)))

(define (expmod base exp m)
  (
   cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square-with-check (expmod base (/ exp 2) m) m) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m ))
  ))
 
(define (miller-rabin-test n) 
   (define (try-it a) 
     (check-it (expmod a (- n 1) n))
     )
  
   (try-it (+ 1 (random (- n 1))))
  )

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

(fast-prime? 561 100)
(fast-prime? 1729 100)
(fast-prime? 2465 100)
(fast-prime? 2821 100)
(fast-prime? 6601 100)


