#lang racket
;By writing explicit multiplication instead of square method we are calling expmod twice nullifying all
;benifits we were gaining by using square procedure.
;and that is why we have converted the procedure back to theta(n) instead of theta(log n) by doing explicit multiplication.