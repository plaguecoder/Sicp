#lang scheme

;recursive procedure

(define (product a next b term)
  (if (> a b) 1
       (* (term a) (product (next a) next b term))
   ))

;iterative procedure

(define (product a next b term)
      (define (mult-iter a result)
        (if (> a b) result
        ( mult-iter (next a) (* result (term a)))
        )
        )
  )