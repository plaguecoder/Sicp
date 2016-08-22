#lang scheme

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init (map (lambda (x) (if (pair? x)
                                                     (car x)
                                                     (x)
                                                     )) seqs))
            (accumulate-n op init (map (lambda (x) (if (pair? x)
                                                     (cdr x)
                                                     (x)
                                                     )) seqs))
            )
      )
  )

(accumulate-n + 0 (list (list 1 2 3 4) (list 4 5 6 4) (list 7 8 9 4) (list 10 11 12 4)))