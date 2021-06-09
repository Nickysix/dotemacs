;;; -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;TODO
;;pdf-view
;;helpful-mode


(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)




(add-to-list 'load-path "~/.emacs.d/elisp/configs")

(load "cfg-variables")
(load "cfg-elegant")
(load "cfg-functions")
(load "cfg-orgmode")
(load "cfg-company")
(load "cfg-dired")


;; * Emacs-mirror epkg

;;Epkg provides access to a local copy of the 
;;[[https://emacsmirror.net][Emacsmirror]] 
;;package database, low-level functions for querying the database, 
;;and a =package.el=-like user interface for browsing the available packages.

(use-package epkg
  :defer t
  :bind
  (("C-c B d" . epkg-describe-package)
   ("C-c B p" . epkg-list-packages)
   ("C-c B r" . borg-remove)
   ("C-c B u" . epkg-update)))




(use-package minions
  :config
  (minions-mode))


(use-package flyspell
  :diminish
  :hook ((prog-mode . flyspell-prog-mode)
         (org-mode . flyspell-mode)
         (text-mode . flyspell-mode)))

(setq ispell-list-command "list")
(setq ispell-program-name "/usr/local/bin/aspell")
(setq ispell-dictionary "en_US") ;; set the default dictionary

(setq  ispell-extra-args '("--sug-mode=ultra"))


(setq ispell-silently-savep t)





(use-package yasnippet
  :bind
  (:map yas-minor-mode-map
        ("TAB" . nil)
        ([tab] . nil))
  :hook
  ((emacs-lisp-mode . yas-minor-mode)
   (html-mode . yas-minor-mode)
   (js-mode . yas-minor-mode)
   (org-mode . yas-minor-mode)
   (python-mode . yas-minor-mode))
  :custom
  (yas-snippet-dirs `(,(expand-file-name "snippets/" user-emacs-directory)))
  (yas-verbosity 2)
  :config
  (yas-reload-all))


(use-package windmove
  :straight nil
  :bind
  (("C-M-<left>". windmove-left)
   ("C-M-<right>". windmove-right)
   ("C-M-<up>". windmove-up)
   ("C-M-<down>". windmove-down)))


(use-package winner
  :straight nil
  :hook (after-init . winner-mode))


(use-package w3m
  :commands (w3m-browse-url w3m-find-file))




(use-package display-line-numbers
  :straight nil
  ;; Display line numbers for programming languages
  :hook (prog-mode . display-line-numbers-mode))

(use-package hl-line
  :straight nil
  :hook
  (after-init . global-hl-line-mode))



(use-package simple
  :straight nil
  :hook
  ((prog-mode . turn-on-auto-fill)
   (text-mode . turn-on-auto-fill)))

(use-package whitespace
  :straight nil
  :hook
  ((prog-mode . whitespace-turn-on)
   (text-mode . whitespace-turn-on))
  :custom
  (whitespace-style '(face empty indentation::space tab trailing)))




;; https://github.com/bbatsov/projectile
(use-package projectile
  :init (setq projectile-cache-file
	      (expand-file-name "emacs_meta/projectile.cache" org-directory)
	      projectile-known-projects-file
	      (expand-file-name "emacs_meta/projectile-bookmarks.eld" org-directory))
  :bind
  ("C-c pp" . projectile-switch-project)
  ("C-c pb" . projectile-switch-to-buffer)
  ("C-c pf" . projectile-find-file)
  ("C-c pg" . projectile-grep)
  ("C-c pk" . projectile-kill-buffers)
  ;; nothing good in the modeline to keep.
  :diminish ""
  :config
  (define-key projectile-mode-map (kbd "H-p") 'projectile-command-map)
  (setq projectile-sort-order 'recently-active)
  (projectile-global-mode))



(use-package ibuffer
  :custom
  (ibuffer-expert t)
  (ibuffer-display-summary nil)
  (ibuffer-use-other-window nil)
  (ibuffer-deletion-face 'dired-flagged)
  (ibuffer-marked-face 'dired-marked)
  :bind ("C-x C-b" . ibuffer))

(use-package ibuffer-projectile
  
  :after (ibuffer projectile)
  :hook
  (ibuffer . (lambda ()
               (ibuffer-projectile-set-filter-groups)
               (unless (eq ibuffer-sorting-mode 'recency)
                 (ibuffer-do-sort-by-recency)))))

(use-package helpful
  
  :config
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key)
  (global-set-key (kbd "C-c C-d") #'helpful-at-point)
  (global-set-key (kbd "C-h F") #'helpful-function)
  (global-set-key (kbd "C-h C") #'helpful-command))


(use-package undo-tree
  
  :bind
  ("M-/" . undo-tree-redo)
  :config
  (global-undo-tree-mode))


(use-package pulse 
  :straight nil)


(use-package isearch
  :straight nil
  :bind
  (("C-S-r" . isearch-backward-regexp)
   ("C-S-s" . isearch-forward-regexp)
   :map isearch-mode-map
   ("<M-down>" . isearch-ring-advance)
   ("<M-up>" . isearch-ring-retreat)
   :map minibuffer-local-isearch-map
   ("<M-down>" . next-history-element)
   ("<M-up>" . previous-history-element))
  :init
  (setq-default
   isearch-allow-scroll t
   lazy-highlight-cleanup nil
   lazy-highlight-initial-delay 0))






























;; * One-line use-package calls

(use-package use-package-ensure-system-package)
(use-package all-the-icons)
(use-package hyperbole)
(use-package general)


(use-package smex
      :disabled
      :init (smex-initialize)
      :bind (("M-x" . smex)))

(use-package amx 
  :config (amx-mode))
  
(use-package imenu-anywhere
  :bind* (("s-i" . imenu-anywhere)))  
  
  

;; M-x describe-personal-keybindings
(use-package bind-key
  :bind ("C-h B" . describe-personal-keybindings))

(bind-key "s-g" #'abort-recursive-edit)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Customize the distracting folding markers.
  (set-display-table-slot
   standard-display-table
   'selective-display
   (let ((face-offset (* (face-id 'shadow) (lsh 1 22))))
     (vconcat (mapcar (lambda (c) (+ face-offset c)) " +"))))



(use-package outshine
  :config
  (add-hook 'emacs-lisp-mode-hook 'outshine-mode)
  (add-hook 'prog-mode-hook 'outline-minor-mode))

(use-package outline-minor-faces
  :after outline
  :config (add-hook 'outline-minor-mode-hook
                    'outline-minor-faces-add-font-lock-keywords))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package quickref
  :init
  (setq quickref-command-prefix (kbd "C-M-q"))
  :config
  (quickref-global-mode 1))


(use-package doc-view
  :init
  (setq doc-view-resolution 200))


(use-package async
  :commands (async-start))
  
  
(use-package restart-emacs
  :bind* (("C-x M-c" . restart-emacs)))  
  
(use-package avy
  :bind (("M-s" . avy-goto-word-1)
         ("M-l" . avy-goto-line)))  
  

(use-package ace-window
  :config
  ;; Show the window designators in the modeline.
  (ace-window-display-mode)

   ;; Make the number indicators a little larger. I'm getting old.
  (set-face-attribute 'aw-leading-char-face nil :height 2.0 :background "black")

  (defun my-ace-window (args)
    "As ace-window, but hiding the cursor while the action is active."
    (interactive "P")
    (cl-letf
        ((cursor-type nil)
         (cursor-in-non-selected-window nil))
      (ace-window nil)))


  :bind (("C-," . my-ace-window))
  :custom
  (aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l) "Designate windows by home row keys, not numbers.")
  (aw-background nil))



(use-package elisp-mode
  :straight nil
  :bind (("C-c C-f" . find-function)
         ("C-c C-v" . find-variable)))



;; * Terminal Shell Configuration * ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; improve colors in terminals
(use-package eterm-256color
  :hook (term-mode))


(use-package vterm
  :config
  (setq vterm-shell (executable-find "zsh")
        vterm-max-scrollback 10000
        vterm-term-environment-variable "eterm-256color"
        vterm-kill-buffer-on-exit t))


(use-package vterm-toggle
  :bind (("s-z" . vterm-toggle)
         ("s-F" . vterm-toggle-forward)
         ("s-B" . vterm-toggle-backward)))
  
  
(use-package shell-pop
  :init
  (setq shell-pop-full-span t)
  :bind (("C-c s" . shell-pop)))


























(use-package smartparens
  :bind
  (("M-<backspace>" . sp-unwrap-sexp)
   ("M-<left>" . sp-forward-barf-sexp)
   ("M-<right>" . sp-forward-slurp-sexp)
   ("M-S-<left>" . sp-backward-slurp-sexp)
   ("M-S-<right>" . sp-backward-barf-sexp))
  :hook
  (after-init . smartparens-global-mode)
  :custom
  (sp-highlight-pair-overlay nil)
  (sp-highlight-wrap-overlay nil)
  (sp-highlight-wrap-tag-overlay nil)
  :config
  (show-paren-mode 0)
  (require 'smartparens-config))












  
  
(use-package move-text
  :config (move-text-default-bindings)) ;; M-up / M-down  
  

  
(use-package rainbow-delimiters
  :hook ((prog-mode . rainbow-delimiters-mode)))
    

    
(use-package which-key
    :diminish which-key-mode
    :init
    (which-key-setup-side-window-bottom)
    ;;(which-key-setup-side-window-right-bottom)
    (setq which-key-side-window-max-height 0.25)
    (setq which-key-idle-delay 0.1)
    (setq which-key-separator " ")
    (setq which-key-prefix-prefix "+")
    (setq which-key-max-description-length 60)
    (which-key-mode 1))


(use-package neotree
  :bind ("<f8>" . 'neotree-toggle)
  :init
  (setq neo-window-width 50)  
  (setq inhibit-compacting-font-caches t)  
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))  
  (setq neo-smart-open t)  
  (setq-default neo-show-hidden-files t))
    
    
    
    
    
    
    
    


(use-package doom-themes
  
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-tomorrow-night t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))
                

(use-package mode-icons
  :config
  (mode-icons-mode))


(use-package doom-modeline
  
  :init
  (setq doom-modeline-height 25)
  (setq doom-modeline-bar-width 3)
  (setq doom-modeline-icon (display-graphic-p))
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline-minor-modes nil)
  (setq doom-modeline-buffer-encoding t)
  (setq doom-modeline-modal-icon t) 
  (doom-modeline-mode 1))  



         
         
         
         
         
         
         
         
         
         















































