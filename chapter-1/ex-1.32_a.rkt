#lang scheme

(define (accumulate combiner null-value a term b next)
   (if(> a b) null-value
      (combiner (term a) (accumulate combiner null-value (next a) term b next))
     
   )
  )
  
(define (sum a term b next) (accumulate + 0 a next b term)
  )

(define (product a term b next) (accumulate * 1 a term b next))
  

