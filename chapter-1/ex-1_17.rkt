#lang racket

(define (double a) (+ a a))
(define (halve b) (/ b 2))

(define (rec-mult a b)
  (if (= b 0) 0
   (if (= b 1) a
   (if (= (remainder b 2) 0)
       (double (rec-mult a (halve b)))
      (+ a (rec-mult a (- b 1)))
      ))))

(rec-mult 2 6)
