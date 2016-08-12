#lang scheme

(define (exp base n)
  (if (= n 0)
      1
      (* base (exp base (- n 1)))
      )
  )

(define (divide-by-n no prod times)
  (if (= (remainder prod no) 0)
      (divide-by-n no (/ prod no) (+ 1 times))
      times
      )
  )

(define (pair a b)
  (* (exp 2 a) (exp 3 b))
  )

(define (car z)
  (divide-by-n 2 z 0)
  )

(define (cdr z)
  (divide-by-n 3 z 0)
  )

(define a (pair 3 5))
(display "(")
(display (car a))
(display ",")
(display (cdr a))
(display ")")