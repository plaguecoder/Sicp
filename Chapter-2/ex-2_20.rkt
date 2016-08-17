#lang scheme

(define (same-parity a . b)
  (define (iter a b result)
  (if(null? (cdr b))
     (if (= (remainder a 2) (remainder (car b) 2))
         (cons (car b) result )
         result)
     (if (= (remainder a 2) (remainder (car b) 2))
         (iter a (cdr b) (cons (car b) result))
         (iter a (cdr b) result)
      )
     )
    )
  (iter a b (list a))
  )

(same-parity 1 2 3 4 5 6 7 8 9)      ; we can reverse it if needed