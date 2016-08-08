#lang racket

; iterative exponentiation

(define (square b) (* b b))

(define (iter-expo b n a)
  (if (= n 0) a
       (if (= (remainder n 2) 0) (iter-expo (square b) (/ n 2) a)      ;even case
           (iter-expo b (- n 1) (* a b)) )))                   ;odd case

(iter-expo 3 0 1)