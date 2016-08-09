#lang scheme

(define (cube z) (* z z z))
(define (increment n) (+ n 1))
(define (sum term a next b)
  (if (> a b) 0 
      (+ (term a) 
          (sum term (next a) next b))))

(define (integral cube a b n)
 (define h (/ (- b a) n))
 (define (multiplier k)
  (cond ((or (= k 0) (= k n)) 1) 
              ((= 1 (remainder k 2)) 4) 
              (else 2)))
  (define (term k) 
     (* (cube (+ a (* h k))) (multiplier k))
     )
   (* (/ (- b a) (* n 3)) (sum term 0 increment n))
  )
  
  


(integral cube 0 1 1000.0)
