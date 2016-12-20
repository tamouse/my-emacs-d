
(defun json-stuff/convert-to-x (str)
  "Converts a JSON string to something or other."
  (interactive)
  (let (jlist)
    (setq jlist (json-read-from-string str))
    jlist
    )
  )

(defun json-stuff/convert-to-org-properties (pair)
  "Convert a pair to an org-property."
  (interactive)
  (org-set-property (car pair) (cdr pair))
  )
