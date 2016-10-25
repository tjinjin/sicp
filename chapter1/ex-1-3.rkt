#lang racket
;; 二乗する
(define (square x)(* x x))

;; 大きい方を返す
(define (compare a b)(if (> a b) a b))

;; 3つの数値から上位2つを返す
;; まとめ
(define (get a b c)(+ (square (compare a b))(square (compare b c))))

;; test
(get 1 2 3)
(get 2 1 3)
(get 3 2 1)
(get 10 20 30)
(get 1 100 10000)

;; 解答
;(define (square x) (* x x))
;(define (sum-of-squares x y)
;    (+ (square x) (square y)))
;
;(define (problem-1-3 x y z)
;    (cond ((and (< x y) (< x z)) (sum-of-squares y z)) ;xが最小
;          ((and (< y x) (< y z)) (sum-of-squares x z)) ;yが最小
;          (else (sum-of-squares x y)) ))
;
;#?=(problem-1-3 1 2 3)
;#?=(problem-1-3 2 1 3)
;#?=(problem-1-3 3 2 1)
