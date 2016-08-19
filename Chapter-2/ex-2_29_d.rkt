#lang scheme

(define (make-mobile left right)                ; answer of part a
  (cons left right))                  

; answer of 2.29_d
; if we change list to cons here. Only changes we would have to do is in the selectors
; where we have to get the 2nd part of the pairs being stored.

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile)
  (car mobile)
  )

(define (right-branch mobile)
  (cdr mobile)             ; instead of (car (cdr mobile))
  )

(define (branch-length branch)
  (car branch)
  )

(define (branch-structure branch)
  (cdr branch)            ; instead of (car (cdr branch))
  )

(define (branch-weight branch)                ; answer of part b
  (if (pair? (branch-structure branch))
      (total-weight (branch-structure branch))
      (branch-structure branch)
     )
  )

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))
     )
  )

(define (branch-torque branch)                ; answer of part c
  (* (branch-length branch) (branch-weight branch))
  )

(define (check-for-kid branch)
  (if (pair? (branch-structure branch))
      (balanced (branch-structure branch))
      1
      )
  )

(define (balanced mobile)
  (if (= (branch-torque (left-branch mobile)) (branch-torque (right-branch mobile)))
      (and (check-for-kid (left-branch mobile)) (check-for-kid (left-branch mobile)))     
      0
      )      
  )


(define left (make-branch 1 (make-mobile (make-branch 2 400) (make-branch 2 200))))
(define right (make-branch 3 200))
(define mobile (make-mobile left right))


(branch-structure left)
(branch-structure right)
(newline)

(branch-length left)
(branch-length right)
(newline)

(branch-weight left)
(branch-weight right)
(newline)

(branch-torque left)
(branch-torque right)
(newline)

(balanced mobile)


