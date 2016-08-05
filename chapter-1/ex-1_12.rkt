#lang racket

(define (pascal a c)(
  if (or (= a 1) (= c 1) (= a c))
  1
  (+ (pascal (- a 1) (- c 1)) (pascal (- a 1) c)) )
  )

(pascal 5 3)