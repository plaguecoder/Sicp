#lang scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
(accumulate (lambda (x y) (cons (p x) y)) null sequence))

(define (append seq1 seq2) (accumulate cons seq2 seq1))

(define (length sequence) (accumulate (lambda (present count) (+ 1 count)) 0 sequence))