(defun kreis (zahl)
  (cond ((or (> zahl 99) (< zahl 1)) "Zahl ist nicht zwischen 1 und 99")
        ((eq zahl 99) 1)
        (T (+ zahl 1))))
