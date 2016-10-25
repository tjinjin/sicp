#lang racket

; 現状の式
; 絶対値を取得する
(define (abs x)
  (if (< x 0)
       (- x)
       x))
(define (sqrt-iter guess x)
        (if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x) x)))
; 推定値をよりよくする
(define (improve guess x)
        (average guess (/ x guess)))
; 平均を取る
(define (average x y)
        (/ (+ x y) 2))
; 推定値の2乗と被開平数の差が事前に決めた値（ここでは0.001）よりも小さくなればいい値
(define (good-enough? guess x)
        (< (abs (- (square guess) x)) 0.001))
; 初期値の推定値を設定する
(define (sqrt x)
        (sqrt-iter 1.0 x))
; 2乗する
(define (square x) (* x x))

(sqrt 9)
;> 3.00009155413138
; ニュートンの逐次近似法は数値xの平方根の推定値としてyがあるとき、yとx/yの平均を取ると良い推定値が求められる

; Q1. good-enough?が小さい数・大きい数に対して不適切である理由をうまくいかない例を上げて説明せよ
; 小さい数 -1などでは無限ループが発生する
; -は想定外っぽい
; xが0.001を下回るとgood-enough?で定義している0.001より誤差がひどくなるらしい
; 10兆から重くなる

; Q2. guessの値の変化を観察して差分がとても小さいなら止めるという方法ではどうだろうか？


; 答え見た
(define (sqrt-iter2 guess pre-guess x)
    (if (good-enough? guess pre-guess)
        guess
        (sqrt-iter2 (improve guess x) guess x)))

(define (average x y)
    (/ (+ x y) 2))

(define (improve guess x)
    (average guess (/ x guess)))

; pre-guess
; 推定値同士を比較してる
(define (good-enough? guess pre-guess)
    (< (/ (abs (- guess pre-guess)) guess) 0.001))

; どこから100が出てきたのか。。。
(define (sqrt x)
    (sqrt-iter2 1.0 100.0 x))
