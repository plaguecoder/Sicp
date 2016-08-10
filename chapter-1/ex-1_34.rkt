#lang racket

;(f f) will result in
;(f 2) will result in
;(2 2) will give error

;each invocation will try to apply its argument to f
;which will after 3 invocations result in an error for (2 2)