;;; make closing a buffer/window on an edited file easier
;;; (I have this finger-wired to ^x ^c)
(defun save-current-buffer-and-kill ()
    "thisandthat."
  (interactive)
  (progn
    (if (buffer-file-name)
	(save-buffer)
      nil)
    (kill-buffer))
  )

;;; return the time as YYYY-MM-DD HH:MM
(defun jekyll-time-string ()
  "Return the current time or given time in epoc seconds as a string used by Jekyll posts: YYYY-MM-DD HH:MM"
  (format-time-string "%Y-%m-%d %H:%M")
  )

;;; insert jekyll time string
(defun insert-jekyll-time-string ()
  "Insert the formatted Jekyll time string"
  (interactive)
  (insert (concat "date: " (jekyll-time-string)))
  )

;;; snakify
(defun snakify-text (start end)
  "Convert text to a snake-case symbol"
  (interactive "r")
  (progn
    (downcase-region start end)
    (subst-char-in-region start end ?  ?_)
    )
  )

;;; camelize
(defun camelize (s)
  "Convert snakified string to CamelCase."
  (interactive "s")
  (if (stringp s)
      (mapconcat 'capitalize (split-string s "_") nil)
    nil)
  )

;;; camelize-file-name
(defun camelize-file-name ()
  "Convert the current buffer's file base name to CamelCase"
  (interactive)
  (if (stringp (buffer-file-name))
      (camelize (file-name-base (buffer-file-name)))
    nil)
  )

;;; indent-buffer does indent-region on the entire buffer
(defun indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max)))
  )

;;; make comment-or-uncomment work with lines or regions
(defun comment-or-uncomment-line-or-region ()
  (interactive)
  (let (start end )
    (if mark-active
        (progn
          (setq start (mark))
          (setq end (point))
          )
      (progn
        (setq start (line-beginning-position))
        (setq end (line-end-position))
        )
      )
    (comment-or-uncomment-region start end)
    )
  )
