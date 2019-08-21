					;Newton法による平方根


;被開関数（これからその平方根を取ろうとする値）の値と予測値の値から出発する
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

(define (average x y)
  (/ (+ x y) 2))

;予測値はそれと被開関数の前の予測値による商との平均値で改善される
(define (improve guess x)
  (average guess (/ x guess)))

;その二乗と被開関数の差が、前もって決めた許容値より小さくなるまで答えを改善する
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;常に、どんな数の平方根も１であると予測することができる（平方根の定義から）
(define (sqrt x)
  (sqrt-iter 1.0 x))

;sample
(sqrt 9)
(sqrt (+ 100 37))
