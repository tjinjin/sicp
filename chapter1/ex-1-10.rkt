#lang racket

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

; (A 1 10)
; 1 else -> (A (- 1 1) (A 1 (- 10 1)))
; 1 else -> (A (- 1 1) (A 1 9))
; 2(A (-1 1) (A 1 9))
; (A 1 9) -> else -> (A (- 1 1) (A 1 (- 9 1)))
; (A 1 9) -> else -> (A (- 1 1) (A 1 8))
; (A 1 9) -> else -> (A (- 1 1) (A 1 8))
; (A (- 1 1)(A 1 n))でどんどん1に近づくのでは？
; で右辺のnが0になるとcond式で0が返る
; (A 0 0)となり、答えは0?
; ↑展開をしっかり考えてない
; 式におこしてみた
;(A 1 10)
;(A 0 (A 1 9))
;(A 0 (A 0 (A 1 8)))
;(A 0 (A 0 (A 0 (A 1 7))))
;(A 0 (A 0 (A 0 (A 0 (A 1 6)))))
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
;(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))
;(A 0 (A 0 (A 0 (A 0 (A 0 32)))))
;(A 0 (A 0 (A 0 (A 0 64))))
;(A 0 (A 0 (A 0 128)))
;(A 0 (A 0 256))
;(A 0 512)
;1024


; (A 2 4)
; (A 2 4)
; (A 1 (A 2 3))
; (A 1 (A 1 (A 2 2)))
; (A 1 (A 1 (A 1 (A 2 1))))
; (A 1 (A 1 (A 1 2)))
; (A 1 (A 1 (A 0 (A 1 1))))
; (A 1 (A 1 (A 0 2)))
; (A 1 (A 1 4))
; (A 1 (A 0 (A 1 3)))
; (A 1 (A 0 (A 0 (A 1 2))))
; (A 1 (A 0 (A 0 (A 0 (A 1 1)))))
; (A 1 (A 0 (A 0 (A 0 2))))
; (A 1 (A 0 (A 0 4)))
; (A 1 (A 0 8))
; (A 1 16) # ここまであってる
; (A 0 (A 0 15))
; (A 0 30)
; 60
; ↑どこかで間違ってる

; (A 0 (A 1 15))
; (A 0 (A 0 (A 1 14)))
; (A 0 (A 0 (A 0 (A 1 13))))
; ...
; ここから(A 1 1)まで展開し、縮約する。
; 2を16回書けるので2の16乗
; よって65536


; (A 3 3)
; (A 2 (A 3 2))
; (A 2 (A 2 (A 3 1)))
; (A 2 (A 2 2))
; (A 2 (A 1 (A 2 1)))
; (A 2 (A 1 2))
; (A 2 (A 0 (A 1 1)))
; (A 2 (A 0 2))
; (A 2 4)
; 以下問題2と同じ


; (define (f n) (A 0 n))
; 2でnを掛け算するのでf(x) = 2n
; (define (g n) (A 1 n))
; nの数だけyを倍乗するので、y = 2^n
; (define (h n) (A 2 n))
; nの数だけyを y = 2^2^n # 書きたいことと式があってない

; f(n) = 2n
; g(n) = 2^n
; h(n) は 2のn回のべき乗
; ex (h 4) = 2^(2^(2^(2)))