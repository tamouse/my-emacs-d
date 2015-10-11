(global-set-key (kbd "C-x C-c") 'save-current-buffer-and-kill)
(global-set-key (kbd "M-SPC")	'fixup-whitespace)
(global-set-key (kbd "C-x C-o") 'delete-blank-lines)
(global-set-key (kbd "C-c C-f")	'auto-fill-mode)
(global-set-key (kbd "C-x /")	'comment-or-uncomment-line-or-region)
(global-set-key (kbd "C-x C-i") 'indent-buffer)
(global-set-key (kbd "C-x \\")	'align-regexp)
(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(define-key global-map "\C-x\C-r" 'rgrep)

;; these just piss me off
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))
