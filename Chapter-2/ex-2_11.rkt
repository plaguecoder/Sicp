#lang scheme

(define (old-mul-interval x y)               ;old multiplication
   (let ((p1 (* (lower-bound x) (lower-bound y))) 
         (p2 (* (lower-bound x) (upper-bound y))) 
         (p3 (* (upper-bound x) (lower-bound y))) 
         (p4 (* (upper-bound x) (upper-bound y)))) 
     (make-interval (min p1 p2 p3 p4) 
                    (max p1 p2 p3 p4))))

 (define (make-interval a b) (cons a b)) 
 (define (upper-bound interval) (max (car interval) (cdr interval))) 
 (define (lower-bound interval) (min (car interval) (cdr interval)))

(define (mul-interval x y)            ; new multiplication
  (define (sign z)
    (cond ((and (>= (lower-bound z) 0) (>= (upper-bound z) 0))
           1)
          ((and (< (lower-bound z) 0) (< (upper-bound z) 0))
           -1)
          (else 0))
        )
  (cond ((and (= (sign x) 1) (= (sign y) 1))              ;when x has both pos
         (make-interval (* (lower-bound x) (lower-bound y))
                        (* (upper-bound x) (upper-bound y)))
         )
        ((and (= (sign x) 1) (= (sign y) 0))
         (make-interval (* (upper-bound x) (lower-bound y))
                        (* (upper-bound x) (upper-bound y)))
         )
        ((and (= (sign x) 1) (= (sign y) -1))
         (make-interval (* (upper-bound x) (lower-bound y))
                        (* (lower-bound x) (upper-bound y)))
         )
        ((and (= (sign x) 0) (= (sign y) 1))              ;when x has mixed signs
         (make-interval (* (lower-bound x) (upper-bound y))
                        (* (upper-bound x) (upper-bound y)))
         )
        ((and (= (sign x) 0) (= (sign y) -1))
         (make-interval (* (upper-bound x) (lower-bound y))
                        (* (lower-bound x) (lower-bound y)))
         )
        ((and (= (sign x) -1) (= (sign y) 1))             ;when x has both negative
         (make-interval (* (lower-bound x) (upper-bound y))
                        (* (upper-bound x) (lower-bound y)))
         )
        ((and (= (sign x) -1) (= (sign y) 0))
         (make-interval (* (lower-bound x) (upper-bound y))
                        (* (lower-bound x) (lower-bound y)))
         )
        ((and (= (sign x) -1) (= (sign y) -1))
         (make-interval (* (upper-bound x) (upper-bound y))
                        (* (lower-bound x) (lower-bound y)))
         )
        ((and (= (sign x) 0) (= (sign y) 0))              ;both x and y have mixed signs
         (make-interval (min (* (lower-bound x) (upper-bound y))
                             (* (upper-bound x) (lower-bound y)))
                        (max (* (lower-bound x) (lower-bound y))
                             (* (upper-bound x) (upper-bound y))))
         )
    ))

(define (eql-interval? a b)            ;procedures to check if old and new mult are equivalent
  (and (= (upper-bound a) (upper-bound b))
       (= (lower-bound a) (lower-bound b)))) 

  (define (ensure-mult-works aH aL bH bL) 
   (let ((a (make-interval aL aH)) 
         (b (make-interval bL bH))) 
   (if (eql-interval? (old-mul-interval a b) 
                      (mul-interval a b)) 
       true 
       (error "new mult returns different value!"  
              a  
              b  
              (old-mul-interval a b) 
              (mul-interval a b)))))


 (ensure-mult-works  +10 +10   +10 +10) 
 (ensure-mult-works  +10 +10   +00 +10) 
 (ensure-mult-works  +10 +10   +00 +00) 
 (ensure-mult-works  +10 +10   +10 -10) 
 (ensure-mult-works  +10 +10   -10 +00) 
 (ensure-mult-works  +10 +10   -10 -10) 
  
 (ensure-mult-works  +00 +10   +10 +10) 
 (ensure-mult-works  +00 +10   +00 +10) 
 (ensure-mult-works  +00 +10   +00 +00) 
 (ensure-mult-works  +00 +10   +10 -10) 
 (ensure-mult-works  +00 +10   -10 +00) 
 (ensure-mult-works  +00 +10   -10 -10) 
  
 (ensure-mult-works  +00 +00   +10 +10) 
 (ensure-mult-works  +00 +00   +00 +10) 
 (ensure-mult-works  +00 +00   +00 +00) 
 (ensure-mult-works  +00 +00   +10 -10) 
 (ensure-mult-works  +00 +00   -10 +00) 
 (ensure-mult-works  +00 +00   -10 -10) 
  
 (ensure-mult-works  +10 -10   +10 +10) 
 (ensure-mult-works  +10 -10   +00 +10) 
 (ensure-mult-works  +10 -10   +00 +00) 
 (ensure-mult-works  +10 -10   +10 -10) 
 (ensure-mult-works  +10 -10   -10 +00) 
 (ensure-mult-works  +10 -10   -10 -10) 
  
 (ensure-mult-works  -10 +00   +10 +10) 
 (ensure-mult-works  -10 +00   +00 +10) 
 (ensure-mult-works  -10 +00   +00 +00) 
 (ensure-mult-works  -10 +00   +10 -10) 
 (ensure-mult-works  -10 +00   -10 +00) 
 (ensure-mult-works  -10 +00   -10 -10) 
  
 (ensure-mult-works  -10 -10   +10 +10) 
 (ensure-mult-works  -10 -10   +00 +10) 
 (ensure-mult-works  -10 -10   +00 +00) 
 (ensure-mult-works  -10 -10   +10 -10) 
 (ensure-mult-works  -10 -10   -10 +00) 
 (ensure-mult-works  -10 -10   -10 -10) 
