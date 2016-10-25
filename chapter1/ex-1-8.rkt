#lang racket

; 立方根は3乗してある数になるもの
; x 求める入力値 ex 8
; guess 推定値
(define (cubic-root-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubic-root-iter (improve guess x) x)))

; よりよい近似を求める方法
(define (improve guess x)
  (/
      (+ (/ x (square guess))
         (* 2 guess)
      ))
  3
)

; 2乗する
(define (square x)(* x x))

; より近似を取る条件式
; ｌｐｌｐｍｐ条件式が微妙そうで時間かかってるかも
(define (good-enough? guess x)
  (< (abs (- (* (square guess) guess)x )) 0.001))

; 初期式
(define (cubic x)
      (cubic-root-iter 1.0 x))


; Answer
(define (cbrt-iter guess pre-guess x)
    (if (good-enough? guess pre-guess)
        guess
        (cbrt-iter (improve guess x) guess x)))

(define (improve guess x)
    (/ (+ (/ x (* guess guess))
                (* 2 guess))
            3))

(define (cbrt x)
    (cbrt-iter 1.0 100.0 x))

; Answer2 https://github.com/yoshiko-pg/SICP/blob/ab4b9d26ef169c59d2c23396af888e2500ed7c30/ex_1_6.scm
(define (cube-root guess x)
      ; guessがpreでimproveの返り値が改善後のguess的な
      (if (< (abs (- guess (improve guess x))) 0.001)
        guess
        (cube-root (improve guess x) x)))
; よりよくした推定値
define (improve guess x)
      (/ (+ (/ x (square guess)) (* guess 2)) 3))
(define (square x) (* x x))
(define (cube x) (cube-root 1.0 x))
(define (triple x) (* x x x))
(define (test-3 x) (triple (cube x)))
