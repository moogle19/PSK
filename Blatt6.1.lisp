(defun matmulmat (mat1 mat2)
	(setf d1 (array-dimensions mat1))	;get list with mat-dimensions
	(setf d2 (array-dimensions mat2))
	(setf emat (make-array (list (first d1) (second d2)) :initial-element 0)) ;make new nxm mat (n = first dim of mat1, m = second dim of mat2)
	(if (not (= (second d1) (first d2))) ; check if dimensions are correct
		(error "Dimensions are not right!")
		(dotimes (spalte (second d2)) ;go through all rows in d2
			(dotimes (zeile (first d1)) ;go through all lines in d1
				(setf (aref emat zeile spalte) ;ref to emat matrix
					(do ((i 0 (+ i 1)) (sum 0))
					(setf sum (+ sum (* (aref mat1 zeile i)
						                (aref mat2 i spalte))))
					))
			)
		)
	)
)