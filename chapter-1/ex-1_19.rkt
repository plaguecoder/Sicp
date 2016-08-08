#lang racket

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
(fib-iter a b
(+ (* p p) (* q q))
(+ (* q q) (* 2 p q)) (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(fib 6)
;0 1 1 2 3 5 8 13 21 34

; (bp + aq)q+(bq + aq +ap)q + (bq + aq +ap)p
; bqp + aqq +bqq + aqq + apq + bqp + aqp + app
; b(qp + qq + qp) + a( qq+ qq + pq + pq + pp)
; b(qq + 2pq) + a (2qq + 2pq + pp)
; b(qq + 2pq) + a (qq + 2pq) + a (qq + pp)
; q`=q^2 +2pq p`=p^2 + q^2