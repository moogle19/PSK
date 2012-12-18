(defun mycount-if (predicate liste)
  ;;fuer den Fall, dass liste eine Liste ist
  (cond ((listp liste)
        (cond
        ((null liste) 0) ;;Rekursionsverankerung
        ;;Methode in predicate angewandt auf das 1.Element aus liste
        ((apply predicate (list (first liste))) 
        (+ 1 (mycount-if predicate (cdr liste))))
        (T (mycount-if predicate (cdr liste)))
        ))
        ;;fuer den Fall, dass liste ein String ist
    ((stringp liste)(cond
        ((null liste) 0)
        ((apply predicate (list(first (coerce liste 'list)))) (+ 1 
                           (mycount-if predicate (cdr (coerce liste 'list)))))
        (T (mycount-if predicate (cdr (coerce liste 'list))))
      )
    )
  )
)
