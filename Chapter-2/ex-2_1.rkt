#lang scheme

(define (make-rat n d)
  (let ((g (gcd n d)))
   (cond
        ((and (> n 0) (< d 0)) (cons (/ (- 0 n) g) (/ (- d 0) g)))
        ((and (< n 0) (< d 0)) (cons (/ (- 0 n) g) (/ (- d 0) g)))
        (else (cons (/ n g) (/ d g)))
        )
    )
  )

(define (numer x) (car x))
(define (denom x) (cdr x))


(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define rational (make-rat 3 3))
(print-rat rational)