(setq visible-bell nil
      echo-keystrokes 0.1
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      color-theme-is-global t
      delete-by-moving-to-trash t
      shift-select-mode nil
      truncate-partial-width-windows nil
      uniquify-buffer-name-style 'forward
      whitespace-style '(trailing lines space-before-tab
                                  indentation space-after-tab)
      whitespace-line-column 100
      ediff-window-setup-function 'ediff-setup-windows-plain
      oddmuse-directory "~/.emacs.d/oddmuse"
      xterm-mouse-mode t
      save-place-file "~/.emacs.d/places"
      fill-column 80
      ido-auto-merge-delay-time 3
      netrc-file "~/.netrc"
      )

(defalias 'yes-or-no-p 'y-or-n-p)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; Don't clutter up directories with backup files
(setq
 backup-directory-alist
 `(("." .
    ,(expand-file-name
      (concat "~/.emacs.d/backups"))
    )
   )
 )

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (blink-cursor-mode -1)
  (when (require 'mwheel nil 'no-error) (mouse-wheel-mode t)))

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(auto-compression-mode t)
(recentf-mode 1)
(menu-bar-mode t)
(global-linum-mode t)
(electric-pair-mode t)
(auto-compression-mode t)
(show-paren-mode 1)

(when (boundp 'hippie-expand-try-functions-list)
  (delete 'try-expand-line hippie-expand-try-functions-list)
  (delete 'try-expand-list hippie-expand-try-functions-list))
