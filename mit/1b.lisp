(defun sos (x y)
  (write-line "Hello, world!")
  (+ (sq x) (sq y))
)

(defun sq (x) (* x x))

(defun fib (n)
  (if (< n 2)
    n
    (+ (fib (- n 1))
       (fib (- n 2)))
    )
  )

(defun move (n from to spare)
  (cond ((= n 0) "DONE")
        (t
          (move (1- n) from spare to)
          (write-line (format nil "Move from ~D to ~D" from to))
          (move (1- n) spare to from)
          )
        )
  )

(move 4 1 2 3)
