(defun mylast (liste)
  (cond ((atom (cdr liste)) (car liste))
        (T (mylast (cdr liste)))))
