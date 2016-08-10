#lang scheme


(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess)
  )

(define (golden-ratio y)
  (fixed-point (lambda (y) (+ 1 (/ 1 y)))y)
  )

(golden-ratio 1.0)