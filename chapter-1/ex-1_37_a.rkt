#lang scheme

(define (cont-frac n d k i)
  (if (= k 0)
     0
     (/ (n i) (+ (d i) (cont-frac n d (- k 1) (+ i 1))))
  )
  )

(/ 1 (cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           12 1))


;i had to make k as 12 to get an approximation of golden ratio that is
;accurate to 4 decimal points.
; k =12   result = 1.6180555555555558