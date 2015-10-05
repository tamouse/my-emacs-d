(require 'package)

;; For packages installed by homebrew
(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path))

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
      '(
	"personal"
	"my-erc-config"
	"my-yasnippets"
	"my-misc-packages"
	"my-js-mode"
	"my-elixir"
	"my-ruby"
	"my-org-setup"
	"my-functions"
	"my-helm-projectile"
	"my-themes"
	"key-bindings"
	"settings"
	)
      )

(require 'server)
(unless (server-running-p)
  (server-start))

(put 'narrow-to-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/Dropbox/org/todo.org" "~/Dropbox/org/rpi-notes.org" "~/Dropbox/org/quotes.org" "~/Dropbox/org/process_journal.org" "~/Dropbox/org/portfolio.org" "~/Dropbox/org/personal_care.org" "~/Dropbox/org/other_notes.org" "~/Dropbox/org/notes.org" "~/Dropbox/org/moving.org" "~/Dropbox/org/mn_exit.org" "~/Dropbox/org/misc-notes.org" "~/Dropbox/org/madmin.org" "~/Dropbox/org/links.org" "~/Dropbox/org/link_journal.org" "~/Dropbox/org/learning.org" "~/Dropbox/org/journal.org" "~/Dropbox/org/inbox.org" "~/Dropbox/org/hackthegap.org" "~/Dropbox/org/diary.org" "~/Dropbox/org/critters.org" "~/Dropbox/org/brewtoad-solr-failure.org" "~/Dropbox/org/ackmann-dickenson.org" "~/Dropbox/org/anniversaries.org" "~/Dropbox/org/art.org" "~/Dropbox/org/books.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
