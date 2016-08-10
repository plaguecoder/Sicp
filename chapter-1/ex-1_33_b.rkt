#lang scheme

(define (filtered-accumulate combiner null-value a term b next filter)
    (if(> a b) null-value
       (if (filter a)
       (combiner (term a) (filtered-accumulate combiner null-value (next a) term b next))
       (combiner null-value (filtered-accumulate combiner null-value (next a) term b next))
       )
  )
  )

(define (square a) (* a a))
(define (increment a) (+ a 1))

(define (gcd a b)
  (if(= b 0) a
     (gcd b (remainder a b))))

(define (prod-of-relative-primes n)
  (define (relative-prime? a)
    ((= (gcd a n) 1)))
  (filtered-accumulate + 0 1 square n increment relative-prime?))
