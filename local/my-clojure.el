;;; Clojure Setup

;; This list from Tom Marble (https://github.com/tmarble/clj.emacs.d)

(mapc 'package-install-if-needed
      '(cider
	clojure-mode
	paredit
	clojure-snippets
	rainbow-delimiters
	))

(require 'clojure-mode)
(require 'cider)
(require 'paredit)
(require 'rainbow-delimiters)

;; Some things from https://github.com/clojure-emacs/cider

(add-hook 'cider-mode-hook #'eldoc-mode)
