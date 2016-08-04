;when very large and  very small numbers are used in arithmetic operations the resultant values are
; so insignificant as compared to original values that they are not not suitable to moniter chnages
; in values of guess.
; to fix this to an extent we can keep track of the difference between succesive guess values.
; We can compare these values and iterate till they are greater than a certain fraction of earlier
; guessed sqrt value. It would drastically improve performance of sqrt function for very small and very large
; numbers.
; though the improvements will not be completely correct for values which are too large or too small because
; the fractions will also grow with the actual values





#lang racket

(define (good guess oldguess x)
  (< (abs(- guess oldguess)) (* guess 0.0001))
 )

(define (improve guess x) (sqrt (/ (+ guess (/ x guess)) 2) guess x))


(define (sqrt guess oldguess x)
  (if (good guess oldguess x)
       guess
       (improve guess x)
    )
  )


(sqrt 1 2 48)