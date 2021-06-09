(provide 'emacs-orgmode-config)
(require 'ox)  

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;; ;; GLOBAL Keybindings that can be added to .emacs
;; (global-set-key [f4] 'org-capture)
;; (global-set-key [f5] '(lambda () (interactive)(find-file "~/org/mygtd.org")))
;; (global-set-key [f6] 'org-todo-list)
;; ;; (global-set-key [f7] 'org-agenda)


(setq org-log-done nil) 
(setq org-startup-truncated nil)

(setq org-directory (expand-file-name "~/org"))
(setq org-default-notes-file (concat org-directory "/mygtd.org"))
(setq org-agenda-files '("~/org" "~/www/org" "~/www/_org"))

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
        ("URGENT" . ?u)
        ("KEY" . ?k)
        ("BONUS" . ?b)
        ("noexport" . ?x)  
        )
      )

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
        ("noexport" . (:foreground "LimeGreen" :weight bold))  
        )
)

(setq org-fast-tag-selection-single-key t)
(setq org-use-fast-todo-selection t)

(setq org-reverse-note-order t)

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/mygtd.org" "Tasks")
         "* TODO %?\nAdded: %U\n" :prepend t :kill-buffer t)
        ("i" "Idea" entry (file+headline "~/org/mygtd.org" "Someday/Maybe")
         "* IDEA %?\nAdded: %U\n" :prepend t :kill-buffer t)
        )
      )

(setq org-use-speed-commands t)

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
   ))

(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

(setq org-babel-default-header-args '((:eval . "never-export")))

(defun org-babel-tangle-block()
  (interactive)
  (let ((current-prefix-arg '(4)))
    (call-interactively 'org-babel-tangle)
))

(add-to-list 'ispell-skip-region-alist '(":\\(PROPERTIES\\|LOGBOOK\\):" . ":END:"))
(add-to-list 'ispell-skip-region-alist '("#\\+BEGIN_SRC" . "#\\+END_SRC"))
(add-to-list 'ispell-skip-region-alist '("#\\+BEGIN_EXAMPLE" . "#\\+END_EXAMPLE"))

(setq org-export-with-smart-quotes t)

(setq org-ascii-links-to-notes nil)

(setq org-ascii-headline-spacing (quote (1 . 1)))

(eval-after-load "org"
  '(require 'ox-gfm nil t))

(setq org-html-coding-system 'utf-8-unix)

(setq org-html-validation-link nil)

(setf org-html-mathjax-options
      '((path "https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML")
        (scale "100") 
        (align "center") 
        (indent "2em")
        (mathml nil))
      )
(setf org-html-mathjax-template
      "<script type=\"text/javascript\" src=\"%PATH\"></script>")

(setq org-html-table-default-attributes
      '(:border "0" :cellspacing "0" :cellpadding "6" :rules "none" :frame "none"))

(eval-after-load "org"
  '(require 'ox-publish nil t))

(
 setq org-publish-project-alist
      '(
        ;; First Project
        ("org-notes"
         :base-directory "~/www/org/"
         :base-extension "org"
         :publishing-directory "~/www/build/"
         :recursive t
         :exclude ".*-template\.org\\|README\.org"        ; exclude org-reveal slides and other files 
         :publishing-function org-html-publish-to-html
         :headline-levels 2               ; Just the default for this project.
         :auto-sitemap t                  ; Generate sitemap.org automagically...
         :sitemap-filename "org-sitemap.org"  ; ... call it sitemap.org (it's the default)...
         :sitemap-title "Plan du site"         ; ... with title 'Sitemap'.
         :with-creator nil    ; Disable the inclusion of "Created by Org" in the postamble.
         :with-email nil      ; Disable the inclusion of "(your email)" in the postamble.
         :with-author nil       ; Enable the inclusion of "Author: Your Name" in the postamble.
         :auto-preamble t;         ; Enable auto preamble 
         :auto-postamble t         ; Enable auto postamble 
         :table-of-contents t        ; Set this to "t" if you want a table of contents, set to "nil" disables TOC.
         :toc-levels 1               ; Just the default for this project.
         :section-numbers nil        ; Set this to "t" if you want headings to have numbers.
         :html-head-include-default-style nil ;Enable the default css style
         :html-head-include-scripts nil ;Disable the default javascript snippet
         :html-head "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n<link rel=\"stylesheet\" type=\"text/css\" href=\"css/org.css\"/>\n<script type=\"text/javascript\" src=\"js/ga.min.js\"></script>" ;Enable custom css style and other tags
         :html-link-home "index.html"    ; Just the default for this project.
         :html-link-up "misc.html"    ; Just the default for this project.
         )

        ("org-static"
         :base-directory "~/www/org/"
         :base-extension "html\\|xml\\|css\\|js\\|png\\|jpg\\|jpeg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|zip\\|gz\\|csv\\|m\\|R\\|el"
         :include (".htaccess")
         :publishing-directory "~/www/build/"
         :recursive t
         :publishing-function org-publish-attachment
         :exclude "Rplots.pdf\\|README\\|LICENSE\\|\\.gitignore"
         )

        ("org" 
         :components ("org-notes" "org-static")
         )


        ;; Second Project
        ("org-r-notes"
         :base-directory "~/teaching/algo-prog-R/org/"
         :base-extension "org"
         :publishing-directory "~/teaching/algo-prog-R/build/"
         :recursive t
         :exclude ".*-template\.org\\|README\.org"        ; exclude org-reveal slides and other files 
         :publishing-function org-html-publish-to-html
         :headline-levels 2               ; Just the default for this project.
         :auto-sitemap t                  ; Generate sitemap.org automagically...
         :sitemap-filename "sitemap.org"  ; ... call it sitemap.org (it's the default)...
         :sitemap-title "Sitemap"         ; ... with title 'Sitemap'.
         :with-creator nil    ; Disable the inclusion of "Created by Org" in the postamble.
         :with-email nil      ; Disable the inclusion of "(your email)" in the postamble.
         :with-author nil       ; Enable the inclusion of "Author: Your Name" in the postamble.
         :auto-preamble t;         ; Enable auto preamble 
         :auto-postamble t         ; Enable auto postamble 
         :table-of-contents t        ; Set this to "t" if you want a table of contents, set to "nil" disables TOC.
         :toc-levels 2               ; Just the default for this project.
         :section-numbers nil        ; Set this to "t" if you want headings to have numbers.
         :html-head-include-default-style nil ;Enable the default css style
         :html-head-include-scripts nil ;Disable the default javascript snippet
         :html-head "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n<link rel=\"stylesheet\" type=\"text/css\" href=\"css/org.css\"/>\n<link rel=\"stylesheet\" type=\"text/css\" href=\"css/logo_uns.min.css\" />\n<script type=\"text/javascript\" src=\"js/ga.min.js\"></script>" ;Enable custom css style and other tags
         :html-link-home "index.html"    ; Just the default for this project.
         :html-link-up "sitemap.html"    ; Just the default for this project.
         )

        ("org-r-static"
         :base-directory "~/teaching/algo-prog-R/org/"
         :base-extension "html\\|xml\\|css\\|js\\|png\\|jpg\\|jpeg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|zip\\|gz\\|csv\\|m\\|R"
         :publishing-directory "~/teaching/algo-prog-R/build/"
         :recursive t
         :publishing-function org-publish-attachment
         :exclude "Rplots.pdf\\|README\\|LICENSE\\|\\.gitignore"
         )

        ("org-r" 
         :components ("org-r-notes" "org-r-static")
         )
        )
      )
