(setq visible-bell t
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
      oddmuse-directory (concat starter-kit-dir "oddmuse")
      xterm-mouse-mode t
      save-place-file (concat starter-kit-dir "places")
      fill-column 80
      ido-auto-merge-delay-time 3
      netrc-file "~/.netrc"
      )

(menu-bar-mode t)
(global-linum-mode t)
(electric-pair-mode t)
(auto-compression-mode t)
(show-paren-mode 1)
(defalias 'yes-or-no-p 'y-or-n-p)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; Don't clutter up directories with backup files
(setq
 backup-directory-alist
 `(("." .
    ,(expand-file-name
      (concat starter-kit-dir "backups"))
    )
   )
 )
