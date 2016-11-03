#lang racket

; 再帰プロセス
(define (f n)
 (if (>= n 3)
   (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))
   (n)))

; 反復プロセス
;(define (f n)
;  (ff 0 1 n))
;
;(define (ff product counter max-count)
;  (if (> counter max-count)
;    product
;    (if (< counter 3) counter)
; 下から積み上げるイメージだとは思ったけど、よくわからず敗北

;; 答え1
;; a <- a + 2b + 3c
;; b <- a
;; c <- b
;; と素直に実装
(define (f n)
  (define (iter a b c count)
    (cond ((= count 0) c)
          ((= count 1) b)
          ((= count 2) a)
          ; ここで反復呼び出し
          ; countを小さくするのは逆では？？？
          (else (iter (+ a (* 2 b) (* 3 c)) a b (- count 1)))))
  (iter 2 1 0 n))
; n = 5
; (iter 2 1 0 5)
; else (iter (+ 2 (* 2 1) (* 3 0)) 2 1 (- 5 1)))
; else (iter 4 2 1 4)
; else else (iter (+ 4 (* 2 2) (* 3 1)) 4 2 (- 4 1))
; else else (iter 11 4 2 3)

;; 答え2
(define (ff n)
    (define (iter new old old2 count)
        (if (>= count n) new
            (iter (+ new old old2) new old (+ 1 count))))
    ; ffが呼び出されると最初にこれが強制的に実行される？
    (iter 3 2 1 3))
