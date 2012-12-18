(defun mycount (item liste)
  ;;fuer den Fall, dass liste eine Liste ist
  (cond ((listp liste)
        (cond
        ((null liste) 0)     ;;Rekursionsanker
        ;;wenn item == 1. Element,
        ;;dann 1 zurueckgeben und
        ;;mycount mit dem Rest aufrufen
        ((eq item (first liste)) 
         (+ 1 (mycount item (cdr liste)))
        )
        ;;sonst nur mycount mit dem Rest aufrufen
        (T (mycount item (cdr liste)))
        ))
        ;;fuer den Fall, dass liste ein String ist
        ((stringp liste)(cond
        ((null liste) 0)   ;;Rekursionsanker
        ;;String zur Liste aus Charactern machen,
        ;;dann s.o.
        ((eq item (first (coerce liste 'list))) 
         (+ 1 (mycount item (cdr (coerce liste 'list)))))
        (T (mycount item (cdr (coerce liste 'list))))
      )
    )
  )
)
