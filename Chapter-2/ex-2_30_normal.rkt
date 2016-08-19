#lang scheme

(define (square x) (* x x))

(define (square-tree tree square)
  (if (null? (cdr tree))
      (if (pair? (car tree))
          (cons (square-tree (car tree) square) (cdr tree))
          (cons (square (car tree)) (cdr tree))
          )
      (if (pair? (car tree))
          (cons (square-tree (car tree) square) (square-tree (cdr tree) square))
          (cons (square (car tree)) (square-tree (cdr tree) square))
          )
      )
  )

(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)) square)
