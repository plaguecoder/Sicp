#lang scheme

(define zero
  (lambda (f)
    (lambda (x) x)))

(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))

(define one                      ;definitions of 1
  (lambda (f)
    (lambda (x)
      (f x))))

(define two                      ;definition of 2
  (lambda (f)
    (lambda (x)
      (f (f x)))))

(define (add a b)                 ;definition of add
   (lambda (f) 
     (lambda (x) 
       ((a f) ((b f) x)))))
