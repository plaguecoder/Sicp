#lang scheme

(define tolerance 0.01)
(define (average a b) (/ (+ a b) 2.0))
(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next)
          )
      )
    )
  (try first-guess)
  )


(define (combine proc1 proc2)
  (lambda (x)
    (proc1 (proc2 x)))
  )

(define (repeated-combine proc n result)
  (if (= n 1)
      result
      (repeated-combine proc (- n 1) (combine proc result))
      )
  )

(define (pow b p) 
   (define (even? x) 
     (= (remainder x 2) 0)) 
    
   (define (sqr x) 
     (* x x)) 
    
   (define (iter res a n) 
     (if (= n 0) 
         res 
         (if (even? n) 
             (iter res (sqr a) (/ n 2)) 
             (iter (* res a) a (- n 1))))) 
    
   (iter 1 b p))

(define (log2 x) (/ (log x) (log 2)))
(define (nth-root n x)
  (fixed-point ((repeated-combine average-damp  (log2 n) average-damp) (lambda (y) (/ x (pow y (- n 1)))))
               1.0)
  )

(nth-root 8 (* 81 81))
