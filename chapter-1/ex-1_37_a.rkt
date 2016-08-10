#lang scheme

(define (cont-frac n d k)
  (if (= k 0)
     0
     (/ (n 1) (+ (d 1) (cont-frac n d (- k 1))))
  )
  )

(/ 1 (cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           12))

;i had to make k as 12 to get an approximation of golden ratio that is
;accurate to 4 decimal points.
; k =12   result = 1.6180555555555558