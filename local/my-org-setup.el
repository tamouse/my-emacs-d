(eval-after-load "org"
  '(require 'ox-md nil t))

(setq org-directory "~/Dropbox/org/")
(setq org-default-notes-file (concat org-directory "notes.org"))
(setq org-capture-templates
      (quote
       (
        ("P" "Personal Care (Insulin, Glucode, Medications, etc)" entry
         (file+datetree+prompt (concat org-directory "personal_care.org"))
         "* %U %?")
        ("c" "Capture Clipboard" entry
         (file (concat org-directory "notes.org"))
         "* %?\n  %x\n  captured_on: %U\n" :empty-lines 1)
        ("j" "Journal Entry" entry
         (file+datetree+prompt (concat org-directory "journal.org" ) )
         "* %^{headline}\n" :clock-in t :clock-resume t)
        ("n" "note" entry
         (file (concat org-directory "notes.org"))
         "* %?\n\n  capture date: %U\n" :empty-lines 1)
        ("p" "Process Journal Entry" entry
         (file+datetree (concat org-directory "process_journal.org"))
         "* %?\n  captured_on: %U\n\n  " :empty-lines 1)
        ("q" "Quotes" entry
         (file (concat org-directory "quotes.org"))
         "* %^{Headline:}\n%i\n%a\n" :empty-lines 1)
        ("s" "selection" entry
         (file (concat org-directory "notes.org"))
         "* %? %^g\n  %i\n  captured_on: %U\n" :empty-lines 1)
        ("t" "todo" entry
         (file (concat org-directory "inbox.org"))
         "* TODO %?\n  created_on: %U\n  link: %a\n" :clock-in t :clock-resume t)
        )))

(setq org-export-backends (quote (ascii html icalendar latex md)))

(setq org-agenda-diary-file (concat org-directory "diary.org"))

(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(define-key global-map "\C-cl" 'org-store-link)
