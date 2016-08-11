#lang scheme

;first implementation

(define (average a b) (/ (+ a b) 2.0))     ;usefull functions
(define (square x) (* x x))

(define (make-point x y) (cons x y))       ;point
(define (x-point z) (car z))
(define (y-point z) (cdr z))
(define (point-dist a b) 
   (sqrt (+ (square (- (x-point a) (x-point b))) 
            (square (- (y-point a) (y-point b))))))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment a b) (cons a b))      ;line
(define (start-segment m) (car m))
(define (end-segment m) (cdr m))
(define (seg-len m) (point-dist (start-segment m) (end-segment m))) 

(define (make-rect side1 side-infront) (cons side1 side-infront))    ;rectangle
(define (side1 rect) (car rect))
(define (side-infront rect) (cdr rect))


(define (width-rect rect) (seg-len (side1 rect))
  )

(define (height-rect rect) (seg-len (make-segment (start-segment (side1 rect))
                                                  (start-segment (side-infront rect))
                                                  )
                                    )
  )

(define (area-rect rect)
  (* (width-rect rect) (height-rect rect))
  )

(define rect-a (make-rect(make-segment (make-point 2 3 ) (make-point 5 6))     ;use
               (make-segment (make-point 1 4 ) (make-point 4 7))
               )
  )

(area-rect rect-a)

