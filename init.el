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
(unless (package-installed-p 'use-package) (package-refresh-contents) (package-install 'use-package))
(org-babel-load-file (expand-file-name "~/.emacs.d/common.org"))
(if (file-exists-p (expand-file-name "~/.emacs.d/local.org"))
  (org-babel-load-file (expand-file-name "~/.emacs.d/local.org"))
  nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bff3bf3adad639ec87c15766758ba3ae5492722fb77932ab5bfd9f232e911c2f" "f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" default)))
 '(org-agenda-files
   (quote
    ("~/Google Drive/org/python-notes.org" "~/Google Drive/org/quotes.org" "~/Google Drive/org/misc-notes.org" "~/Google Drive/org/ddates2017.org" "~/Google Drive/org/software-for-good.org" "~/Google Drive/org/writing.org" "~/Google Drive/org/vagrant-notes.org" "~/Google Drive/org/ux-notes.org" "~/Google Drive/org/thor-notes.org" "~/Google Drive/org/swaac-notes.org" "~/Google Drive/org/static-sites.org" "~/Google Drive/org/shell-notes.org" "~/Google Drive/org/ruby-notes.org" "~/Google Drive/org/rpi-notes.org" "~/Google Drive/org/rails-notes.org" "~/Google Drive/org/postgres-notes.org" "~/Google Drive/org/personal_care.org" "~/Google Drive/org/portfolio.org" "~/Google Drive/org/lisp-notes.org" "~/Google Drive/org/link_journal.org" "~/Google Drive/org/learning.org" "~/Google Drive/org/journal.org" "~/Google Drive/org/javascript-notes.org" "~/Google Drive/org/inbox.org" "~/Google Drive/org/html-notes.org" "~/Google Drive/org/hackthegap.org" "~/Google Drive/org/gdi-classes.org" "~/Google Drive/org/emacs-notes.org" "~/Google Drive/org/elixir-notes.org" "~/Google Drive/org/docker-notes.org" "~/Google Drive/org/diary.org" "~/Google Drive/org/devops-notes.org" "~/Google Drive/org/css-notes.org" "~/Google Drive/org/critters.org" "~/Google Drive/org/clojure-notes.org" "~/Google Drive/org/braintree-notes.org" "~/Google Drive/org/books.org" "~/Google Drive/org/art.org" "~/Google Drive/org/anniversaries.org" "~/Google Drive/org/WordPress-notes.org")))
 '(org-trello-current-prefix-keybinding "C-c o" nil (org-trello))
 '(package-selected-packages
   (quote
    (jsx-mode :org-trello org-trello monokai-theme darkokai-theme darkmine-theme darkburn-theme darkane-theme circe xquery-mode js2-mode htmlize yaml-mode use-package ox-reveal)))
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
>>>>>>> Stashed changes
