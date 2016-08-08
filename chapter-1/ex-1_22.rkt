#lang scheme

(define (square x)(* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((= 0 (remainder n test-divisor)) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n m)
  (newline)
  (start-prime-test n m (current-inexact-milliseconds)))


(define (start-prime-test n m start-time)
  (if (> n m) (display "done")
      ( if (prime? n)
      (report-prime (- (current-inexact-milliseconds) start-time) n m)
      (start-prime-test (+ n 2) m (current-inexact-milliseconds) )
      )))

(define (report-prime elapsed-time n m)
  (display n)
  (display " is prime ")
(display elapsed-time)
  (display " ")
  ( if(< n m)
  (start-prime-test (+ n 2) m (current-inexact-milliseconds) ) ( display "done"))
  )

(define (search_for_primes n m)
  (if (= (remainder n 2) 0) (timed-prime-test (+ n 1) m) (timed-prime-test n m)
      ))

(search_for_primes 1000 1020)
(search_for_primes 10000 10038)
(search_for_primes 100000 100044)


;We see that the trend of root(10) is being roughly followed.
;1009 is prime 0.001953125 1013 is prime 0.001953125 1019 is prime 0.002197265625 done
;10007 is prime 0.005126953125 10009 is prime 0.005126953125 10037 is prime 0.005126953125 done
;100003 is prime 0.01611328125 100019 is prime 0.01611328125 100043 is prime 0.01611328125 done
