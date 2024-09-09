;; Import util functions
(load "./util.lisp")

;; (defun sum-int (a b)
;;   (if (> a b)
;;     0
;;     (+ a (sum-int (1+ a) b))
;;     )
;;   )
;;
;; and
;;
;; (defun sum-sq (a b)
;;   (if (> a b)
;;     0
;;     (+ (square a) (sum-sq (1+ a) b))
;;     )
;;   )
;;
;;
;; when modified to use higher-order functions, are:

(defun sum (term a next b)
  (if (> a b)
    0
    (+ (funcall term a)
       (sum term
            (funcall next a)
            next
            b))
    )
  )

(defun pi-sum (a b)
  (sum
    (lambda (x) (/ 1 (* x (+ x 2))))
    a
    (lambda (x) (+ x 4))
    b
    )
  )

(defun sum-int (a b)
  (defun identity (a) a)
  (sum identity a 1+ b)
  )

(defun sum-sq (a b)
  (sum square a 1+ b)
  )

;; (defun *sqrt* (x)
;;   (fixed-point
;;     (lambda (y) (average (/ x y) y))
;;     )
;;   )

(defun average-damp (f)
  (lambda (x) (average (funcall f x) x))
  )

(defun fixed-point (f start)
  (defvar tolerance 0.0001)
  (defun iter (old new)
    (if (close-enough old new)
      new
      (iter new (funcall f new))
      )
    )
  (defun close-enough (a b) (< (abs (- a b)) tolerance))
  (iter start (funcall f start))
  )

;; (defun *sqrt* (x)
;;   (fixed-point
;;     (average-damp (lambda (y) (/ x y)))
;;     1
;;     )
;;   )

(defun *sqrt* (x)
  (newton (lambda (y) (- x (square y)))
          1)
  )

(defun newton (f guess)
  (defvar df (deriv f))
  (fixed-point
    (lambda (x) (- x (/ (funcall f x) (funcall df x))))
    guess
    )
  )

(defun deriv (f)
  (defvar dx 0.000001)
  (lambda (x) (/ (- (funcall f (+ x dx)) (funcall f x)) dx))
  )
