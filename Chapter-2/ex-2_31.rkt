#lang scheme

(define (square x) (* x x))

(define (tree-map proc tree)
  (map (lambda (x) (if (pair? x)
                       (tree-map square x)
                       (proc x)
                       )
                    ) tree)
  )

(define (square-tree tree) (tree-map square tree))

(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))