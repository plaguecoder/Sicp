#lang scheme


(define (cont-frac n d k)
  (define (iterator result curr-k)
    (if (= curr-k 0)
        result
        (iterator (/ (n curr-k) (+ (d curr-k) result)) (- curr-k 1)))
    )
  (iterator 0 k)
  )

(cont-frac (lambda (i) 1.0)
           (lambda (i) (if (= (remainder (+ i 1) 3) 0)
                           (* 2.0 (/ (+ i 1) 3)) 1.0
                           )
             )
           100
           )