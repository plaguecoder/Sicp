#lang racket
;reccursive function
;(define (func-recursive n)
;  (if (< n 3)
;      n
;      (+ (func-recursive (- n 1)) (* 2 (func-recursive (- n 2))) (* 3 (func-recursive (- n 3))))))

;(func-recursive 5)


;iterative function
(define (func-iter n)
  (if (< n 3)
      n
      (iterator 2 1 0 n))
  )

(define (iterator a b c count)    ;here a is prev (n-1) ,b is prev prev (n-2) and c is prev prev prev (n-3)
  (if (< count 3) 
      a
      (iterator (+ a (* 2 b) (* 3 c)) a b (- count 1))
      )                        ; with every iteration we are passing values of a to b and b to c while saving
  )                            ; sum of all in a.

(func-iter 4)

;                            f(4)
;           f(3)          + 2*f(2) + 2*f(1)
; 1*f(2) + 2*f(1) + 3*f(0)
