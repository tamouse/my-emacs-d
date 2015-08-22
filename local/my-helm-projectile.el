(package-install-if-needed 'helm-projectile)

(require 'helm)
(require 'helm-config)
;(global-set-key (kbd "C-c h") 'helm-command-prefix)
(define-key helm-map (kbd "C-z") 'helm-select-action)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))
(setq helm-split-window-in-side-p t
      helm-move-to-line-cycle-in-source t
      helm-ff-search-library-in-sexp t
      helm-scroll-amount 8
      helm-ff-file-name-history-use-recentf t)
(helm-mode 1)

(projectile-global-mode)
(setq
 projectile-completion-system 'helm
 projectile-switch-project-action 'projectile-dired
 projectile-find-dir-includes-top-level t
 projectile-mode-line '(:eval (format " Prj[%s]" (projectile-project-name)))
 )
