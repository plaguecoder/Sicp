#lang racket

(define (p) (p))
(define (test x y)
(if (= x 0) 0
y))

(test 0 (p))

;With an interpreter that uses applicative order evaluation the interpreter would
;solve for the second argument (p) as well which would end it up into infinite recursion.
; whereas an interpreter with normal order evaluation would not evaluate the alternate
;of if condition because the predicate of if is already true in this case.
; consequently in first case there would be no output whereas in second case output would be 0