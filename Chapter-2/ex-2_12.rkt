#lang scheme

 (define (make-interval a b) (cons a b)) 
 (define (upper-bound interval) (max (car interval) (cdr interval))) 
 (define (lower-bound interval) (min (car interval) (cdr interval)))

(define (make-center-percent center percent)
  (cons (- center (/ (* percent center) 100))
        (+ center (/ (* percent center) 100)))
  )

(define (percent z)
  (/ (* (- (cdr z) (/ (+ (car z) (cdr z)) 2)) 100) (/ (+ (car z) (cdr z)) 2) )
  )

(define (center z)
  (/ (+ (car z) (cdr z)) 2)
  )