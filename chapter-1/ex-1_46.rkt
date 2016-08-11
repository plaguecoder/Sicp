#lang racket

(define tolerance 0.00001)
(define (good-enough? g1 g2)
  (< (abs (- g1 g2)) tolerance)
  )

(define (iterative-improve good-enough? improve-guess)
  (lambda (guess) (if (good-enough? guess (improve-guess guess))
                      (improve-guess guess)
                      ((iterative-improve good-enough? improve-guess) (improve-guess guess))
                      )
    )
  )

;square-root procedure in terms of iterative-improve

(define (sqrt x)
  ((iterative-improve good-enough? ( lambda (y) (/ (+ (/ x y) y) 2) )
                     )1.0)
  )

(sqrt 49)

;fixed-point procedure in terms of iterative-improve

(define (fixed-point proc first-guess)
  ((iterative-improve good-enough? proc) first-guess)
  )

(fixed-point cos 1.0)


