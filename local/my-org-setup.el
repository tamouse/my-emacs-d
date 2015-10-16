(eval-after-load "org"
  '(require 'ox-md nil t))

(setq org-directory "~/Dropbox/org/")
(setq org-default-notes-file (concat org-directory "notes.org"))
(setq org-capture-templates
      (quote
       (
        ("I" "Insulin taken" entry
         (file+datetree+prompt (concat org-directory "personal_care.org"))
         "* Insulin Taken %U %?")
        ("M" "Meds taken" entry
         (file+datetree+prompt (concat org-directory "personal_care.org"))
         "* Meds taken %U %?")
        ("j" "Journal Entry" entry
         (file+datetree (concat org-directory "journal.org" ) )
         "* %?\n" :clock-in t :clock-resume t)
        ("n" "note" entry
         (file (concat org-directory "notes.org"))
         "* %?\n\n  capture date: %U\n" :empty-lines 1)
        ("p" "Process Journal Entry" entry
         (file+datetree (concat org-directory "process_journal.org"))
         "* %?\n  captured_on: %U\n\n  " :empty-lines 1)
        ("l" "Link Journal Entry" entry
         (file+datetree (concat org-directory "link_journal.org"))
         "* %?\n  captured_on: %U\n\n  " :empty-lines 1)
        ("q" "Quotes" entry
         (file (concat org-directory "quotes.org"))
         "* %^{Headline:}\n%i\n%a\n" :empty-lines 1)
        ("t" "todo" entry
         (file (concat org-directory "inbox.org"))
         "** TODO %?\n\n  created_at: %U\n" :clock-in t :clock-resume t)
        )))

(setq org-export-backends (quote (ascii html icalendar latex md)))

(setq org-agenda-diary-file (concat org-directory "diary.org"))

(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(define-key global-map "\C-cl" 'org-store-link)
