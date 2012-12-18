(defun quadmatp (mat)
	(setf dim (array-dimensions mat))
	(equal (fist dim) (second dim))
)