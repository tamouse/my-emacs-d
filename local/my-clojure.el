;;; Clojure Setup

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
