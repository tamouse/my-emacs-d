(require 'erc)
(setq 
 erc-hide-list '("JOIN" "PART" "QUIT")
 erc-kill-buffer-on-part t
 erc-kill-queries-on-quit t
 erc-autojoin-channels-alist '(("freenode.net"
				"#emacs"
				"#ruby"
				"#jekyll"
				"#RubyonRails-offtopic"
				"#callahans"
				"#RubyOnRails"
				"#rubyonrails-offtopic"
				"#ruby.mn")
			       ("foonetic.net" "#xkcdfurs"))
 erc-autojoin-delay 5
 erc-modules '(autoaway autojoin button completion fill irccontrols
			list log match menu move-to-prompt netsplit
			networks noncommands readonly ring stamp track)
 erc-nick "pontiki"
 erc-nick-uniquifier "_"
 erc-user-full-name user-full-name
 erc-email-userid "tamouse@gmail.com"
 erc-keywords '("\\btam\\b"
		"\\btamara\\b"
		"\\btamouse\\b"
		"\\bmousie\\b"
		"\\bmousey\b"
		"\\bsqueeq\\b"
		"\\bsqeeq\\b"
		)
 erc-fools '("Grimes" "Gridley")
 )
