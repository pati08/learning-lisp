
(defun *sqrt* (x)
    (defun improve (guess x)
      (average guess (/ x guess)))

    (defun good-enough (guess x)
      (< (abs (- (square guess) x))
         .001))
    (defun try (guess x)
      (if (good-enough guess x)
        guess
        (try (improve guess x) x)))
  (try 1 x))

(defun square (x) (* x x))

(defun average (a b) (/ (+ a b) 2))

(write (round (float (*sqrt* 16))))

;; (defun main ()
;;   (dotimes (a 100) (*sqrt* 16)))

;; (sb-ext:save-lisp-and-die "hello-world" :executable t :toplevel 'main)
