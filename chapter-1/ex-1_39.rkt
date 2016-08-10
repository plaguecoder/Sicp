#lang racket

(define (cont-frac n d k)
  (define (iterator result curr-k)
    (if (= curr-k 1)
        (/ (n curr-k) (+ (d curr-k) result))
        (iterator (/ (n curr-k) (+ (d curr-k) result)) (- curr-k 1)))
    )
  (iterator 0 k)
  )

(define (tan-cf x k)
(cont-frac (lambda (i) (if (= i 1) x (* (- 0 x) x)))
           (lambda (i) (- (* 2 i) 1))
           k
           )
  )

(define pi 3.14)
(tan-cf (/ pi 6) 100.0)

;result is 0.5769964003928729