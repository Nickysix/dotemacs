(use-package org
  :bind (:map org-mode-map
         ("RET" . org-return-indent)
         ("M-p" . outline-previous-visible-heading)
         ("M-n" . outline-next-visible-heading)
         ("s-t" . org-todo)
         ("M-[" . org-metaleft)
         ("M-]" . org-metaright))
         
  :init
  (setq org-tags-column -80         
        org-pretty-entities t 
        org-src-fontify-natively t 
        org-src-tab-acts-natively t 
        org-list-allow-alphabetical t 
        org-special-ctrl-a/e t
        org-startup-folded t 
        org-startup-truncated nil
        org-startup-indented nil
        org-image-actual-width 1800
        org-directory (expand-file-name "~/norg")
        org-default-notes-file (concat org-directory "/refile.org")
        org-agenda-files '("~/norg") 
        org-fast-tag-selection-single-key t
        org-use-fast-todo-selection t
        org-use-speed-commands nil
        org-reverse-note-order t)


 
  :config
  
  (setq org-todo-keywords
      '(
        (sequence "IDEA(i)" "TODO(t)" "STARTED(s)" "NEXT(n)" "WAITING(w)" "|" "DONE(d)")
        (sequence "|" "CANCELED(c)" "DELEGATED(l)" "SOMEDAY(f)")
        ))


(setq org-todo-keyword-faces
      '(("IDEA" . (:foreground "GoldenRod" :weight bold))
        ("NEXT" . (:foreground "IndianRed1" :weight bold))
        ("STARTED" . (:foreground "OrangeRed" :weight bold))
        ("WAITING" . (:foreground "coral" :weight bold))
        ("CANCELED" . (:foreground "LimeGreen" :weight bold))
        ("DELEGATED" . (:foreground "LimeGreen" :weight bold))
        ("SOMEDAY" . (:foreground "LimeGreen" :weight bold))
        ))


(setq org-todo-keywords
      '(
        (sequence "LINUX(L)" "EMACS(E)" "OCCULT(O)" "ASTRO(A)" "RESEARCH(R)" "|" "DONE(d)")
        (sequence "|" "CANCELED(c)" "DELEGATED(l)" "SOMEDAY(f)")
        ))


(setq org-todo-keyword-faces
      '(("LINUX" . (:foreground "#98971a" :weight bold))
        ("EMACS" . (:foreground "#b16286" :weight bold))
        ("OCCULT" . (:foreground "d65d0e" :weight bold))
        ("ASTRO" . (:foreground "coral" :weight bold))
        ("RESEARCH" . (:foreground "LimeGreen" :weight bold))
        ("DELEGATED" . (:foreground "LimeGreen" :weight bold))
        ("SOMEDAY" . (:foreground "LimeGreen" :weight bold))
        ))


(setq org-tag-persistent-alist
      '((:startgroup . nil)
        ("HOME" . ?h)
        ("RESEARCH" . ?r)
        ("TEACHING" . ?t)
        (:endgroup . nil)
        (:startgroup . nil)
        ("OS" . ?o)
        ("DEV" . ?d)
        ("WWW" . ?w)
        (:endgroup . nil)
        (:startgroup . nil)
        ("EASY" . ?e)
        ("MEDIUM" . ?m)
        ("HARD" . ?a)
        (:endgroup . nil)
        ("UCANCODE" . ?c)
        ("URGENT" . ?u)
        ("KEY" . ?k)
        ("BONUS" . ?b)
        ("noexport" . ?x)))

(setq org-tag-faces
      '(
        ("HOME" . (:foreground "GoldenRod" :weight bold))
        ("RESEARCH" . (:foreground "GoldenRod" :weight bold))
        ("TEACHING" . (:foreground "GoldenRod" :weight bold))
        ("OS" . (:foreground "IndianRed1" :weight bold))
        ("DEV" . (:foreground "IndianRed1" :weight bold))
        ("WWW" . (:foreground "IndianRed1" :weight bold))
        ("URGENT" . (:foreground "Red" :weight bold))
        ("KEY" . (:foreground "Red" :weight bold))
        ("EASY" . (:foreground "OrangeRed" :weight bold))
        ("MEDIUM" . (:foreground "OrangeRed" :weight bold))
        ("HARD" . (:foreground "OrangeRed" :weight bold))
        ("BONUS" . (:foreground "GoldenRod" :weight bold))
        ("UCANCODE" . (:foreground "GoldenRod" :weight bold))
        ("noexport" . (:foreground "LimeGreen" :weight bold))))
  
  
  
  
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/mygtd.org" "Tasks")
         "* TODO %?\nAdded: %U\n" :prepend t :kill-buffer t)
        ("i" "Idea" entry (file+headline "~/org/mygtd.org" "Someday/Maybe")
         "* IDEA %?\nAdded: %U\n" :prepend t :kill-buffer t)
       )  
  
)  


(org-babel-do-load-languages
  'org-babel-load-languages
 '(
   (emacs-lisp . t)
   (org . t)
   (shell . t)
   (C . t)
   (python . t)
   (gnuplot . t)
   (octave . t)
   (R . t)
   (dot . t)
   (awk . t)
  )
)


(use-package deft
  
  :init
  (setq deft-directory "~/norg")
  (setq deft-recursive t)
  (setq deft-use-filename-as-title t)
  (setq deft-default-extension "org")
  (setq deft-extensions '("org"))
  (setq deft-use-filter-string-for-filename t)
  (setq deft-file-naming-rules '((noslash . "-")
                                 (nospace . "-")
                                 (case-fn . downcase)))
  (setq deft-text-mode 'org-mode)
  (setq deft-org-mode-title-prefix t))


(use-package olivetti
  :config
  (add-hook 'org-mode-hook 'olivetti-mode))

(use-package org-variable-pitch
  :config
  (add-hook 'org-mode-hook 'org-variable-pitch-minor-mode))




) ;; closing paren to org configuration.
