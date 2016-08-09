#lang racket

;fast-exponentiation creates large numbers when computing exponents and then applies remainder procedure.
;This whole process is computationally very expensive.
;whereas expmod keeps numbers small in size, thus reducing computational complexity.