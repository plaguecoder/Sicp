#lang scheme

(define (make-interval a b) (cons a b)) 
(define (upper-bound interval) (max (car interval) (cdr interval))) 
(define (lower-bound interval) (min (car interval) (cdr interval))) 

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y)))
  )

(define (sub-interval x y)                 ; interval subtraction procedure
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))
                 )
  )

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (width z)
  (- (upper-bound z) (lower-bound z))
  )

(define (div-interval x y)
  (if(= (width y) 0)               ; added condition to check width of divisor
      (display "error")
      (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))
                ))
  )

(define a (make-interval 1 9))
(define b (make-interval 12 12))

(div-interval a b)

