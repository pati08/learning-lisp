;; Load util functions
(load "./util.lisp")

;; If we use "wishful thinking" to assume that we already HAVE the constructor
;; and the selectors for the parts, we can work with any compound data.
;; (defun make-rat (n d)) -> some compound data
;; (defun numer (compound-data)) -> numerator part
;; (defun denom (compound-data)) -> denominator part

(defun make-rat (n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))
    )
  )
(defun numer (r) (car r))
(defun denom (r) (cdr r))

(defun +rat (x y)
  (make-rat (+ (* (numer x) (denom y)) (* (numer y) (denom x)))
            (* (denom x) (denom y))
            )
  )

(defun *rat (x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))
            )
  )

(defvar a (make-rat 1 2))
(defvar b (make-rat 1 4))
(write (+rat a b))
