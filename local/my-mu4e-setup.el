(require 'mu4e)

;; default
;; (setq mu4e-maildir "~/Maildir/tamouse")

(setq mu4e-drafts-folder "/tamouse/Drafts"
      mu4e-sent-folder   "/tamouse/Sent Mail"
      mu4e-trash-folder  "/tamouse/Trash"
      user-mail-address "tamouse@gmail.com"
      )

;; don't save message to Sent Messages, Gmail/IMAP takes care of this
;;(setq mu4e-sent-messages-behavior 'delete) ; fetchmail never brings them back!

;; (See the documentation for `mu4e-sent-messages-behavior' if you have
;; additional non-Gmail addresses and want assign them different
;; behavior.)

;; setup some handy shortcuts
;; you can quickly switch to your Inbox -- press ``ji''
;; then, when you want archive some messages, move them to
;; the 'All Mail' folder by pressing ``ma''.

(setq mu4e-maildir-shortcuts
      '(("/tamouse"       . ?t)
	("/tamouse.lists" . ?l)
	("/other"         . ?O)
	("/archive"  . ?a)
	))

;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "fetchmail")

;; something about ourselves
(setq
   mu4e-compose-signature
    (concat
     user-full-name
     "\n"
     user-mail-address
     "\n"
     "http://www.tamouse.org\n"))

(setq mu4e-view-prefer-html nil)
(setq mu4e-view-show-addresses t)

(add-to-list 'mu4e-view-actions
  '("ViewInBrowser" . mu4e-action-view-in-browser) t)

;; Viewing html mail
(require 'mu4e-contrib)
(setq mu4e-html2text-command 'mu4e-shr2text)
;;(setq mu4e-html2text-command "pandoc -f html -t plain")
;;(setq mu4e-html2text-command "html2text -nobs -utf8")


;; sending mail -- replace USERNAME with your gmail username
;; also, make sure the gnutls command line utils are installed
;; package 'gnutls-bin' in Debian/Ubuntu
(require 'smtpmail)
;; (setq message-send-mail-function 'smtpmail-send-it
;;    starttls-use-gnutls t
;;    smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
;;    smtpmail-auth-credentials
;;      '(("smtp.gmail.com" 587 "tamouse@gmail.com" nil))
;;    smtpmail-default-smtp-server "smtp.gmail.com"
;;    smtpmail-smtp-server "smtp.gmail.com"
;;    smtpmail-smtp-service 587)

;; alternatively, for emacs-24 you can use:
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-stream-type 'starttls
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)

;; don't keep message buffers around
(setq message-kill-buffer-on-exit t)

(setq my-mu4e-account-alist
  '(("/tamouse"
     (mu4e-drafts-folder "/tamouse/Drafts")
     (mu4e-sent-folder   "/tamouse/Sent Mail")
     (mu4e-trash-folder  "/tamouse/Trash")
     (user-mail-address "tamouse@gmail.com")
     (smtpmail-smtp-user "tamouse@gmail.com")
     )
    ("/tamouse.lists"
     (mu4e-drafts-folder "/tamouse.lists/Drafts")
     (mu4e-sent-folder   "/tamouse.lists/Sent Mail")
     (mu4e-trash-folder  "/tamouse.lists/Trash")
     (user-mail-address "tamouse.lists@gmail.com")
     (smtpmail-smtp-user "tamouse.lists@gmail.com")
     )
    )
  )


(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
	  (if mu4e-compose-parent-message
	      (mu4e-message-field mu4e-compose-parent-message :maildir)
	    (completing-read (format "Compose with account: (%s) "
				     (mapconcat #'(lambda (var) (car var))
						my-mu4e-account-alist "/"))
			     (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
			     nil t nil nil (caar my-mu4e-account-alist))))
	 (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
	(mapc #'(lambda (var)
		  (set (car var) (cadr var)))
	      account-vars)
      (error "No email account found"))))

(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)
