(use-package color-theme :ensure t)
(use-package darkburn-theme :ensure t)
(use-package darkmine-theme :ensure t)
(use-package darkokai-theme :ensure t)
(use-package monokai-theme :ensure t)
(use-package zenburn-theme :ensure t)
(use-package darkane-theme :ensure t :config (load-theme 'darkane t))

(setq
 user-mail-address "tamouse@gmail.com"
 user-organization "Tamara Temple Web Development"
 user-home-page    "http://www.tamouse.org"
 user-signature    (concat user-full-name " <" user-mail-address ">")
 )

(setq visible-bell nil
   indent-tabs-mode nil
   echo-keystrokes 0.1
   font-lock-maximum-decoration t
   transient-mark-mode t
   delete-by-moving-to-trash t
   truncate-partial-width-windows nil
   uniquify-buffer-name-style 'forward
   whitespace-style '(trailing lines space-before-tab
                                  indentation space-after-tab)
   xterm-mouse-mode t
   save-place-file "~/.emacs.d/places"
   fill-column 80
   ido-auto-merge-delay-time 3
   netrc-file "~/.netrc"
   css-indent-offset 2
   )

(defalias 'yes-or-no-p 'y-or-n-p)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;; Don't clutter up directories with backup files
(setq
 backup-directory-alist
 `(("." .
    ,(expand-file-name
   (concat "~/.emacs.d/backups"))
    )
   )
 )


(put 'narrow-to-region 'disabled nil)

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

(defun package-install-if-needed (p)
  (unless (package-installed-p p)
    (package-install p))
  )

(defun save-current-buffer-and-kill ()
  "Automatically save the current buffer before killing it, no questions asked."
  (interactive)
  (progn
    (if (buffer-file-name)
        (save-buffer)
      nil)
    (kill-buffer))
  )
(global-set-key (kbd "C-x C-c") 'save-current-buffer-and-kill)

(defun jekyll-time-string ()
  "Return the current time or given time in epoc seconds as a string used by Jekyll posts: YYYY-MM-DD HH:MM"
  (format-time-string "%Y-%m-%d %H:%M"))

(defun insert-jekyll-time-string ()
  "Insert the formatted Jekyll time string"
  (interactive)
  (insert (concat "date: " (jekyll-time-string))))

(defun snakify-text (start end)
  "Convert text to a snake-case symbol"
  (interactive "r")
  (progn
    (downcase-region start end)
    (subst-char-in-region start end ?  ?_)))

(defun camelize (s)
  "Convert snakified string to CamelCase."
  (interactive "s")
  (if (stringp s)
      (mapconcat 'capitalize (split-string s "_") nil)
    nil))

(defun camelize-file-name ()
  "Convert the current buffer's file base name to CamelCase"
  (interactive)
  (if (stringp (buffer-file-name))
      (camelize (file-name-base (buffer-file-name)))
    nil))

(defun indent-buffer ()
  "Indent the entire buffer"
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max))))
(global-set-key (kbd "C-x C-i") 'indent-buffer)

(defun comment-or-uncomment-line-or-region ()
  "DWIM comment or uncomment line or region"
  (interactive)
  (let (start end )
    (if mark-active
        (progn
          (setq start (mark))
          (setq end (point)))
      (progn
        (setq start (line-beginning-position))
        (setq end (line-end-position))))
    (comment-or-uncomment-region start end)))

(global-set-key (kbd "C-x /")	'comment-or-uncomment-line-or-region)

(use-package magit
  :ensure t
  :bind (("C-c m" . magit-status)))

(eval-after-load "org"
  '(require 'ox-md nil t))

(setq
 org-directory "~/Google Drive/org/"
 org-default-notes-file (concat org-directory "inbox.org")
 org-capture-default-template "w"
 org-agenda-diary-file (concat org-directory "diary.org")
 org-refile-targets '((org-agenda-files . (:maxlevel . 2)))
 org-personal-care-file (expand-file-name (concat org-directory "personal_care.org"))
 org-journal-file (expand-file-name (concat org-directory "journal.org"))
 org-process-journal-file (expand-file-name (concat org-directory "process_journal.org"))
 org-link-journal-file (expand-file-name (concat org-directory "link_journal.org"))
 org-quotes-file (expand-file-name (concat org-directory "quotes.org"))
 org-test-file (expand-file-name (concat org-directory "test.org"))
 )
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c l") 'org-store-link)

(setq org-ditaa-jar-path "/usr/local/Cellar/ditaa/0.10/libexec/ditaa0_10.jar")
;(require 'ditaa)
(org-babel-do-load-languages 'org-babel-load-languages
 '((ditaa . t)
   (python . t)
   (ruby . t)
   (emacs-lisp . t)
   )
 )

(use-package ox-reveal
  :ensure ox-reveal)
(setq org-reveal-root "https://cdn.jsdelivr.net/reveal.js/3.0.0/")
(setq org-reveal-mathjax t)
(use-package htmlize
  :ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Org Protocol Server
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (if (equal (system-name) "pontiki2.local")
;;     (start-process
;;      "org-protocol-server"
;;      "org-protocol-server-buffer"
;;      "/Users/tamara/.gem/ruby/2.3.1/bin/emacs_org_protocol_server"
;;      )
;;   nil)

(require 'org-protocol)

(setq
 org-capture-templates
 (quote
  (
   ("p" "Templates for personal care")
   ("pi" "Insulin taken" entry
    (file+datetree+prompt org-personal-care-file)
    "* Insulin Taken %^{INSULIN_AMOUNT}p%^{INSULIN_TYPE}p %(org-set-property \"CAPTURE_DATE\" \"%U\")\n"
    :immediate-finish t
    :empty-lines 1
    )
   ("pg" "Glucose Reading" entry
    (file+datetree+prompt org-personal-care-file)
    "* Glucose Reading %^{GLUCOSE_READING}p %(org-set-property \"CAPTURE_DATE\" \"%U\")"
    :immediate-finish t
    :empty-lines 1
    )
   ("pc" "Carbs Planned" entry
    (file+datetree+prompt org-personal-care-file)
    "* Carbs Planned %^{CARBS_PLANNED}p %(org-set-property \"CAPTURE_DATE\" \"%U\")"
    :immediate-finish nil
    :empty-lines 1
    )
   ("pm" "Meds taken" entry
    (file+datetree+prompt org-personal-care-file)
    "* Meds taken %? %(org-set-property \"CAPTURE_DATE\" \"%U\")\n"
    :immediate-finish nil
    :empty-lines 1
    )
   ("pn" "Personal Care Note" entry
    (file+datetree+prompt org-personal-care-file)
    "* &? %(org-set-property \"CAPTURE_DATE\" \"%U\")\n"
    :empty-lines 1
    )
   ("pb" "Breakfast" entry
    (file+datetree+prompt org-personal-care-file)
    "* breakfast notes %(org-set-property \"CAPTURE_DATE\" \"%U\")\n"
    :empty-lines 1
    )
   ("pl" "Lunch" entry
    (file+datetree+prompt org-personal-care-file)
    "* lunch notes %(org-set-property \"CAPTURE_DATE\" \"%U\")\n"
    :empty-lines 1
    )
   ("ps" "Supper" entry
    (file+datetree+prompt org-personal-care-file)
    "* supper notes %(org-set-property \"CAPTURE_DATE\" \"%U\")\n"
    :empty-lines 1
    )
   ("j" "Templates for journal capture")
   ("jj" "Journal Entry" entry
    (file+datetree+prompt org-journal-file)
    "* %^{Headline} %^G %(org-set-property \"CAPTURE_DATE\" \"%U\")\n"
    :clock-in t
    :clock-resume t
    :empty-lines 1
    )
   ("jp" "Process Journal Entry" entry
    (file+datetree+prompt org-process-journal-file)
    "* %? %(org-set-property \"CAPTURE_DATE\" \"%U\")\n"
    :clock-in t
    :clock-resume t
    :empty-lines 1
    )
   ("jl" "Link Journal Entry" entry
    (file+datetree+prompt org-link-journal-file)
    "* %? %(org-set-property \"CAPTURE_DATE\" \"%U\")\n"
    :empty-lines 1
    )
   ("n" "note" entry
    (file org-default-notes-file)
    "* %? %(org-set-property \"CAPTURE_DATE\" \"%U\")\n"
    :empty-lines 1
    )
   ("q" "Quotes" entry
    (file org-quotes-file)
    "* %^{Headline:} %(org-set-property \"CAPTURE_DATE\" \"%U\")\n"
    :empty-lines 1
    )
   ("t" "todo" entry
    (file org-default-notes-file)
    "* TODO %? %(org-set-property \"CAPTURE_DATE\" \"%U\")\n"
    :empty-lines 1
    )
   ("a" "appointment" entry
    (file org-default-notes-file)
    "* %^{Appointment:} %^T"
    )
   ("T" "Test" entry
    (file org-test-file)
    "* %^{Headline} %^G %(org-set-property \"CAPTURE_DATE\" \"%U\")\n"
    empty-lines 1
    )
   ("w" "Default Org-protocol Capture Template" entry
    (file+datetree org-link-journal-file)
    "* %:description %(org-set-property \"CAPTURE_DATE\" \"%U\")%(org-set-property \"LINK\" \"%:link\")%(org-set-property \"TITLE\" \"%:description\")\n%:initial\n"
    :empty-lines 1
    )
   ("x" "alt org-prot template" entry
    (file org-test-file)
    "* testing org-capture with json
%:link
%:description
%:initial
"
    )
   )))

;;; make every text file an org file
(add-to-list 'auto-mode-alist '("\\.te\?xt\\'" . org-mode))

(use-package org-trello :ensure t)

(setq dired-guess-shell-alist-user
      (pcase system-type
	(darwin
	 '(("\\.\\(gif\\|jpe?g\\|png\\|mp3\\|mp4\\|pdf\\)\\'" "open"))
	 )
	(_ nil)
	))

(use-package ruby-tools
  :ensure t)

(setq
 ruby-use-smie nil
 ruby-comment-column 40
 ruby-deep-arglist nil
 ruby-deep-indent-paren nil
 ruby-deep-indent-paren-style nil
 )
(global-set-key (kbd "C-x \\")	'align-regexp)

(defun tpt/align-ruby-hash (beg end)
  "Make new ruby hash syntax align nicely"
  (interactive "r")
  (align-regexp beg end "\\(\\s-*\\)\\(:\\s-+\\)\\(.\\)" 2 2 nil))

(define-key ruby-mode-map
  (kbd "C-x :") 'tpt/align-ruby-hash)

(add-to-list
 'hs-special-modes-alist
 '(ruby-mode
   "\\(class\\|module\\|def\\|do\\|{\\)" "\\(end\\|end\\|end\\|end\\|}\\)" "#"
   (lambda (arg) (ruby-end-of-block)) nil))

(add-to-list 'auto-mode-alist '("\\.jbuilder" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))

(use-package js2-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.jsonb\\'" . js2-mode))
  )

(use-package jsx-mode :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
  )

(use-package php-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
  )

(use-package helm-projectile
  :ensure t
  :config
  (require 'helm)
  (require 'helm-config)
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
  )

(use-package alchemist
  :ensure t
  :config
  (setq alchemist-key-command-prefix (kbd "C-c ,")) ;; default is C-c a, which is org-agenda
  (add-to-list 'alchemist-mode-hook (lambda () (company-mode))))

;;; Clojure Setup

;; This list from Tom Marble (https://github.com/tmarble/clj.emacs.d)
;; Some things from https://github.com/clojure-emacs/cider

;; (use-package rainbow-delimiters :ensure t)
;; (use-package clojure-snippets :ensure t)
;; (use-package paredit :ensure t)
;; (use-package clojure-mode :ensure t)
;; (use-package cider
;;   :ensure t
;;   :config
;;   (add-hook 'cider-mode-hook #'eldoc-mode)
;;   )

(autoload 'apache-mode "apache-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))

(use-package nginx-mode :ensure t)

(use-package coffee-mode :ensure t)

(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode)
  (add-hook 'markdown-mode-hook 'emmet-mode)
  )

(use-package sass-mode :ensure t)

(use-package scss-mode
  :ensure t
  :config
  (setq scss-compile-at-save nil)) ; this bugs me so much

(use-package stylus-mode :ensure t)

(use-package markdown-mode :ensure t
  :config
  (add-to-list 'auto-mode-alist
	       '("\\.\\(md\\|mkd\\|markdown\\)" . markdown-mode))
  (add-to-list 'auto-mode-alist
	       '("\\.\\(md\\|mkd\\|markdown\\)\\.\\(erb\\|tt\\)" . markdown-mode))
  )

(setq feature-default-language "en")
(use-package feature-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode)))

(use-package yaml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.\\(yml\\|yaml\\)\\.\\(erb\\|tt\\)" . yaml-mode))
  )

(use-package haml-mode :ensure t)

(use-package slim-mode :ensure t)

(use-package web-mode :ensure t
  :config
  (setq
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-sql-indent-offset 2
   )
  )

(setq grep-command "grep -nH -e "
      grep-find-command (quote ("find . -type f -exec grep -nH -e  {} +" . 34))
      grep-find-ignored-directories (quote
				     ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg"
				      ".bzr" "_MTN" "_darcs" "{arch}" ".idea"))
      grep-find-template "find . <X> -type f <F> -exec grep <C> -nH -e <R> {} +"
      grep-highlight-matches nil
      grep-template "grep <X> <C> -nH -e <R> <F>"
      grep-use-null-device nil)
(global-set-key (kbd "C-x \\")	'align-regexp)

;; (require 'erc-sasl)

;; (setq
;;  erc-kill-buffer-on-part t
;;  erc-kill-queries-on-quit t
;;  erc-autojoin-channels-alist
;;  '(("freenode.net" "#callahans")
;;    ("transadvice.org" "#lobby")
;;    ("foonetic.net" "#xkcdfurs"))
;;  erc-autojoin-delay 2
;;  erc-modules
;;  '(autojoin button completion fill irccontrols
;; 	    list log match menu move-to-prompt netsplit
;; 	    networks noncommands readonly ring stamp track)
;;  erc-nick "tamouse__"
;;  erc-nick-uniquifier "_"
;;  erc-user-full-name user-full-name
;;  erc-email-userid "tamouse@gmail.com"
;;  erc-keywords '("\\btam\\b"
;; 		"\\btamara\\b"
;; 		"\\btamouse\\b"
;; 		"\\bmousie\\b"
;; 		"\\bmousey\b"
;; 		"\\bsqueeq\\b"
;; 		"\\bsqeeq\\b"
;; 		)
;;  )

(use-package circe :ensure t)

(setq auth-sources '("~/.authinfo"))
(defun my-fetch-password (&rest params)
  (require 'auth-source)
  (let ((match (car (apply 'auth-source-search params))))
    (if match
	(let ((secret (plist-get match :secret)))
	  (if (functionp secret)
	      (funcall secret)
	    secret))
      (error "Password not found for %S" params)))
  )
(defun my-freenode-sasl-password (server)
  (my-fetch-password :user "tamouse__" :host "irc.freenode.net")
  )

(defun my-transadvice-sasl-password (server)
  (my-fetch-password :user "eveningrose" :host "irc.transadvice.org"))

(setq circe-network-options
      '(("Freenode"
	 :tls t
	 :nick "tamouse__"
	 :sasl-username "tamouse__"
	 :sasl-password my-freenode-sasl-password
	 :channels (:after-auth "#callahans")
	 )
	("TransAdvice"
	 :host "irc.transadvice.org"
	 :port "6667"
	 :nick "eveningrose"
	 :nickserv-password my-transadvice-sasl-password
	 :channels (:after-auth "#lobby")
	 )
	("TransAdvice-alt1"
	 :host "ranma.ftee.org"
	 :port "6667"
	 :nick "eveningrose"
	 :nickserv-password my-transadvice-sasl-password
	 :channels (:after-auth "#lobby")
	 )
	("TransAdvice-alt2"
	 :host "irc.funkykitty.net"
	 :port "6667"
	 :nick "eveningrose"
	 :nickserv-password my-transadvice-sasl-password
	 :channels (:after-auth "#lobby")
	 )
	)
      )
(setq circe-reduce-lurker-spam t)
(setq circe-format-server-topic "*** Topic change by {userhost}: {topic-diff}")
(setq circe-format-say "{nick:-16s} {body}")

(require 'circe-color-nicks)
(enable-circe-color-nicks)
(require 'circe-lagmon)
(require 'circe-new-day-notifier)
(enable-circe-new-day-notifier)

(defun transadvice ()
  (interactive)
  (circe "TransAdvice"))

(defun freenode ()
  (interactive)
  (circe "Freenode"))

(use-package try :ensure t)

(use-package which-key :ensure t
  :config
  (which-key-mode))

(use-package counsel
  :ensure t
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line)))

(use-package ivy
  :ensure t
  :diminish (ivy-mode)
  :bind (("C-x b" . ivy-switch-buffer))
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-display-style 'fancy))


(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
         ("C-r" . swiper)
         ("C-c C-r" . ivy-resume)
         ("M-x" . counsel-M-x)
         ("C-x C-f" . counsel-find-file))
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-display-style 'fancy)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

(use-package editorconfig :ensure t :config (editorconfig-mode 1))

(use-package lorem-ipsum :ensure t)

(require 'time-stamp)
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-active t)

(use-package xquery-mode :ensure t )

(use-package multiple-cursors
  :ensure t
  :bind
  (("C->" . mc/mark-next-like-this)
   ("C-<" . mc/mark-previous-like-this)
   ("C-c C-<" . mc/mark-all-like-this)))

(use-package yasnippet
  :ensure t
  :config
  (setq  yas-snippet-dirs '("~/.emacs.d/snippets/") )
  (yas-global-mode 1))

(require 'server)
(unless (server-running-p)
  (server-start))

(global-set-key (kbd "M-SPC")	'fixup-whitespace)
(global-set-key (kbd "C-x C-o") 'delete-blank-lines)
(global-set-key (kbd "C-c M-a f") 'auto-fill-mode)
(global-set-key (kbd "C-x \\")	'align-regexp)
(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(define-key isearch-mode-map (kbd "C-o")
  (lambda () (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp
                 isearch-string
               (regexp-quote isearch-string))))))

;; these just piss me off
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))
