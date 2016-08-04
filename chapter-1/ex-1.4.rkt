#lang racket

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
(a-plus-abs-b 3 -4)

;The given procedure is an example of a combination where
;operators ( if (> b 0) + -) ) here are also compound expression in themselves