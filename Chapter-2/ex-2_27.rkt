#lang scheme

(define x (list (list 1 2) 4 7 (list 3 4)))
x

(define (deep-reverse l)
  (define (iter l result)
    (if (null? (cdr l))
      (if(pair? (car l))
         (cons (iter (car l) null) result)
         (cons (car l) result)
      )
      (if(pair? (car l))
         (iter (cdr l) (cons (iter (car l) null) result))
         (iter (cdr l) (cons (car l) result))
      )
      )
    )
  (iter l null)
  )

(deep-reverse x)
