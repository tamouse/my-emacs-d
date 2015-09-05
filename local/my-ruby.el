(package-install-if-needed 'ruby-tools)
(require 'ruby-mode)
(require 'ruby-tools)
(setq
 ruby-use-smie nil
 ruby-comment-column 40
 ruby-deep-arglist nil
 ruby-deep-indent-paren nil
 ruby-deep-indent-paren-style nil
 )

;; Make new ruby hash syntax align nicely
(defun tpt/align-ruby-hash (beg end)
  (interactive "r")
  (align-regexp beg end "\\(\\s-*\\)\\(:\\s-+\\)\\(.\\)" 2 2 nil)
  )

(define-key ruby-mode-map
  (kbd "C-x :") 'tpt/align-ruby-hash
  )

;;; Usable hide/show support in ruby mode
(add-to-list 'hs-special-modes-alist
	     '(ruby-mode
	       "\\(class\\|module\\|def\\|do\\|{\\)" "\\(end\\|end\\|end\\|end\\|}\\)" "#"
	       (lambda (arg) (ruby-end-of-block)) nil))
