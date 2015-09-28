(package-install-if-needed 'js3-mode)
(autoload 'js3-mode "js3" "Start js3-mode" t)
(add-to-list 'auto-mode-alist '("\\.js" . js3-mode))
(add-to-list 'auto-mode-alist '("\\.json" . js3-mode))
