(setq inhibit-startup-message t)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/extras/"))
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
;; For packages installed by homebrew
(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))
(package-initialize)
(org-babel-load-file (expand-file-name "~/.emacs.d/my-init.org"))
(put 'narrow-to-region 'disabled nil)
