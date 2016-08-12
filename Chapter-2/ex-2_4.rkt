#lang scheme

(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)              ;definition of cdr
  (z (lambda (p q) q)))

(define point (cons 1 2))

(define (print-point p)
  (newline)
  (display "(")
  (display (car p))
  (display ",")
  (display (cdr p))
  (display ")"))

(print-point point)

;substitution

; (car (cons a b))
; ((cons a b) (lambda (p q) p)) 
; ((lambda (m) (m a b)) (lambda (p q) p)) 
; ((lambda (p q) p) a b)
; a
 


