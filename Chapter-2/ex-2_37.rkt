#lang scheme

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init (map (lambda (x) (if (pair? x) (car x) (x)
                                                     )) seqs))
            (accumulate-n op init (map (lambda (x) (if (pair? x) (cdr x) (x)
                                                     )) seqs))
            )))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v) (map (lambda (x) (dot-product v x)) m))

(define (transpose mat) (accumulate-n cons null mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map(lambda (y) (map (lambda (x) (dot-product x y)) m)) n)
    )
  )

(define v (list 1 2 3 4))
(define m (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define n (list (list 1 1 1 1) (list 1 1 1 1) (list 1 1 1 1)))

(matrix-*-vector m v)
(transpose m)
(matrix-*-matrix m n)