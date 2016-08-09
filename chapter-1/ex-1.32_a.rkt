#lang scheme

recursive process

(define (accumulate combiner null-value a term b next)
   (if(> a b) null-value
      (combiner (term a) (accumulate combiner null-value (next a) term b next))
   )
  )


(define (sum a term b next) (accumulate + 0 term a next b)) 
  
(define (product a term b next) (accumulate * 1 term a next b)) 