#lang scheme

(define (product a next b term pos)
  (if (> pos b) 1
       (* (term a) (product (next a (+ pos 1)) next b term (+ pos 1)))
   ))

;(define (factorial a b)
;  (define (inc k) (+ k 1))
;  (define (term z) z)
;  (product a inc b term)
;)

;(factorial 1 6)

(define (aprox-to-pi a b)
  (define (next a n) (if (= (remainder n 2) 0) (/ (+ n 2) (+ n 1))
                         (/ (+ n 1) (+ n 2))
    ))
  
  (define (term z) z)
   (product a next b term 1)
  )

(* 4(aprox-to-pi (/ 2.0 3) 1000))