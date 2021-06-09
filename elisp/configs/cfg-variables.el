(use-package emacs
  :init
  (setq inhibit-startup-screen t
        initial-scratch-message nil
        sentence-end-double-space nil
        ring-bell-function 'ignore
        frame-resize-pixelwise t)

  (setq user-full-name "Nick Robitaille"
        user-mail-address "computerscience4747@gmail.com")

  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  
  (setq enable-local-variables :all)
  
  (setq icomplete-mode t)
  
  (setq fido-mode -1)
  
  ;; stop emacs from littering the file system with backup files
  (setq make-backup-files nil
        auto-save-default nil
        create-lockfiles nil)
  
  
  ;; follow symlinks 
  (setq vc-follow-symlinks t)
  
  
  (setq custom-safe-themes t)
  
  (setq pop-up-swindows nil)
  
  (setq linum-format "  %4d  ")
  
  (setq column-number-mode t)
  
  ;; use common convention for indentation by default
  (setq-default indent-tabs-mode t)
  (setq-default tab-width 2)
  (setq-default browse-url-browser-function 'browse-url-generic)
  (setq-default browse-url-generic-program "google-chrome-stable")

  
  (setq default-process-coding-system '(utf-8-unix . utf-8-unix))
  
  (setq locale-coding-system 'utf-8
        coding-system-for-read 'utf-8
        coding-system-for-write 'utf-8)
        
        
        
        
        
  ;; less noise when compiling elisp
  (setq byte-compile-warnings '(not free-vars unresolved noruntime lexical make-local))
  (setq native-comp-async-report-warnings-errors nil)
  (setq load-prefer-newer t)      
        
        
  (setq recentf-exclude `(,(expand-file-name "straight/build/" user-emacs-directory)
                          ,(expand-file-name "eln-cache/" user-emacs-directory)
                          ,(expand-file-name "etc/" user-emacs-directory)
                          ,(expand-file-name "var/" user-emacs-directory)))
        
        

  :config
  
  ;;(add-to-list 'default-frame-alist '(fullscreen . maximized))

(ignore-errors (set-frame-font "Menlo-14"))

  
  

  ;; default to utf-8 for all the things
  (set-charset-priority 'unicode)
  
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)
  
  
  (set-frame-parameter nil 'unsplittable t)

  ;; write over selected text on input... like all modern editors do
  (delete-selection-mode t)

  ;; enable recent files mode.
  (recentf-mode t)
  
  ;; don't want ESC as a modifier
  (global-set-key (kbd "<escape>") 'keyboard-escape-quit)

  
  

  

  ;; don't show any extra window chrome
  (when (window-system)
    (menu-bar-mode 1)
    (tool-bar-mode -1)
    (tooltip-mode -1)
    (scroll-bar-mode -1))
    
  

  ;; enable winner mode globally for undo/redo window layout changes
  (winner-mode t)
  
  (global-font-lock-mode 1)
  
  (global-display-line-numbers-mode t)

  ;;(global-linum-mode 1)
  
  (global-auto-revert-mode 1)

  (show-paren-mode t)
  
  (electric-pair-mode 1)
  
  (global-so-long-mode)
  
  (global-eldoc-mode 1)
  
  ;; clean up the mode line
  (display-time-mode -1)
  
  (add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(require 'hl-line)
(add-hook 'prog-mode-hook #'hl-line-mode)
(add-hook 'text-mode-hook #'hl-line-mode)
(set-face-attribute 'hl-line nil :background "gray21")

  
  
  
  
) ;; end (use-package emacs)
