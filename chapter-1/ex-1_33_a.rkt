#lang scheme

(define (filtered-accumulate combiner null-value a term b next filter)
    (if(> a b) null-value
       (if (filter a)
       (combiner (term a) (accumulate combiner null-value (next a) term b next))
       (combiner null-value (accumulate combiner null-value (next a) term b next))
       )
  )
  )

(define (sum-of-sq-prime) (filtered-accumulate + 0 a square b increment prime?))
