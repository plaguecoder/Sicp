#lang scheme

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (reverse sequence)
(fold-right (lambda (x y) (append y (list x))) null sequence))

(reverse (list 1 2 3 4 5 6))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (reverse1 sequence)
(fold-left (lambda (x y) (cons y x)) null sequence))

(reverse1 (list 1 2 3 4 5 6))