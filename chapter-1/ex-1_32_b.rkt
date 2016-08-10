#lang scheme

;recursive process

;(define (accumulate combiner null-value a term b next)
;   (if(> a b) null-value
;      (combiner (term a) (accumulate combiner null-value (next a) term b next))
;   )
;  )

;iterative process

(define (accumulate combiner null-value a term b next)
  (define(iterator a result)
    (if (> a b) null-value
        (iterator (next a) (combiner result (term a)))
        )
  )
  (iterator a null-value)
  )

