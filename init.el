(require 'package)
(add-to-list 'load-path (expand-file-name "~/.emacs.d/use-package/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/local/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

(require 'org)

(defun package-install-if-needed (p)
  (unless (package-installed-p p)
    (package-install p))
  )

(mapc 'load
      '("settings"
	"key-bindings"
	"my-themes"
	"my-helm-projectile"
	"my-functions"
	"my-org-setup"
	"my-ruby"
	"my-elixir"
	"my-js-mode"
	"my-misc-packages"
	"personal"
	)
      )

(require 'server)
(unless (server-running-p)
  (server-start))

(put 'narrow-to-region 'disablled nil)
