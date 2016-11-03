#lang racket

;何が求められてるの？？？

; 解答
; パスカルの三角形である要素を求めるには左上と右上の数値を足せばいい
(define (pascal x y) ;x:行, y:列
  (cond ((= y 1) 1)
        ((= x y) 1)
        (else (+ (pascal (- x 1) (- y 1))
                 (pascal (- x 1) y)))))
; (pascal 4 3)
; else (+ (pascal (- 4 1) (- 3 1))
;          (pascal (- 4 1) 3))
