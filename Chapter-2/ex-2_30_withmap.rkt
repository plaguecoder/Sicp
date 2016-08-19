#lang scheme

(define (square x) (* x x))

(define (square-tree tree square)
  (map (lambda (x) (if (pair? x)
                       (square-tree x square)
                       (square x)
                       )
                    ) tree)
  )

(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)) square)
