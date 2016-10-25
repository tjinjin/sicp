#lang racket

; old
(define  (sqrt-iter guess)
  (if (good-enough? guess)
    guess
    (sqrt-iter (improve guess))))

; new-if
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

; new
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

; p19よりifは最初にpredicateを評価し、真の場合はconsequentを評価し、値を返す。そうでなければalternativeを評価し返却する。
; LISPはp16にあるように適用順序評価で引数を評価してから適用する原則であり、この場合condは適用順序評価が適用される。
; そうするインタプリタは引数を先に評価しようとするが、else句が先に評価されてしまい無限ループが発生する。
