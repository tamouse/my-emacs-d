(autoload 'js-mode "Javascript" "Start js-mode" t)
(add-to-list 'auto-mode-alist '("\\.js" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json" . js-mode))
(setq js-indent-level 2)
