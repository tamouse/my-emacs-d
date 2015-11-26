(require 'polymode)
;; (require 'markdown-mode)
(require 'poly-markdown)

(defcustom pm-inner/markdown+yaml
  (clone pm-inner/markdown
	 :mode 'yaml-mode
	 :head-reg "\\`---"
	 :tail-reg "[^\\`]---")
  "YAML header in Markdown files"
  :group 'innermodes
  :type 'object)

(defcustom pm-poly/markdown+yaml
  (clone pm-inner/markdown
	 :innermode 'pm-inner/markdown+yaml)
  "Markdown+YAML configuration"
  :group 'polymodes
  :type 'object)

;;;###autoload  (autoload 'poly-markdown+yaml-mode "poly-markdown+yaml")
(define-polymode poly-markdown+yaml-mode pm-poly/markdown+yaml)
(provide 'poly-markdown+yaml)
