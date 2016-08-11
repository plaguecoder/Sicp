#lang scheme

(define (average a b) (/ (+ a b) 2.0))

(define (make-point x y) (cons x y))
(define (x-point z) (car z))
(define (y-point z) (cdr z))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


(define (make-segment a b) (cons a b))
(define (start-segment m) (car m))
(define (end-segment m) (cdr m))
  
(define (midpoint-segment line-segment)
  (make-point
   (average (x-point (start-segment line-segment)) (x-point (end-segment line-segment)))
   (average (y-point (start-segment line-segment)) (y-point (end-segment line-segment)))
   )
  )

(define line-segment (make-segment (make-point 0 0) (make-point 9 0)))

(print-point (midpoint-segment line-segment ))



