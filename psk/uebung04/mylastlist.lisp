(defun mylastlist (liste)
  (cond ((atom (cdr liste)) (cons (car liste) '()))
        (T (mylastlist (cdr liste)))))
