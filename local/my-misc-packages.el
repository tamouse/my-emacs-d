(mapc 'package-install-if-needed
      '(
	polymode
	magit
	lorem-ipsum
	sass-mode
	scss-mode
	stylus-mode
	markdown-mode
	feature-mode
	yaml-mode
	haml-mode
	slim-mode
	web-mode
	php-mode
	;; f ; what's this do?
	))

(require 'magit)
(global-set-key (kbd "C-c m")   'magit-status)

(require 'lorem-ipsum)

(require 'time-stamp)
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-active t)

(autoload 'apache-mode "apache-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))
(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.\\(php|phtml" . php-mode))

(require 'sass-mode)
(require 'scss-mode)
(setq scss-compile-at-save nil) ; this bugs me so much

(require 'stylus-mode)
(require 'markdown-mode)
(add-to-list 'auto-mode-alist
	     '("\\.\\(md\\|mkd\\|markdown\\)" . markdown-mode))


(setq feature-default-language "en")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))

;;(require 'polymode)
;;(require 'poly-markdown+yaml)
;;(add-to-list 'auto-mode-alist '("\\.\\(md\\|markdown\\)" . poly-markdown-mode))
