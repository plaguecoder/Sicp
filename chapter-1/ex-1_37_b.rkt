#lang scheme

#|
recursive procedure

(define (cont-frac n d k i)
  (if (= k 0)
     0
     (/ (n i) (+ (d i) (cont-frac n d (- k 1) (+ i 1))))
  )
  )

(/ 1 (cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           12 1))
|#

;iterative procedure

(define (cont-frac n d k)
  (define (iterator result curr-k)
    (if (= curr-k 0)
        result
        (iterator (/ (n curr-k) (+ (d curr-k) result)) (- curr-k 1)))
    )
  (iterator 0 k)
  )

(/ 1 (cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           12))
