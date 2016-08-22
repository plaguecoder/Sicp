#lang scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (node)
                     (if (pair? node)
                         (count-leaves node)
                         1
                         )) t)
              )
  )

(define x (cons (list 1 (list 2 4)) (list 3 4)))
(count-leaves x)