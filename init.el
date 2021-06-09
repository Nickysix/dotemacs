;;; init.el --- Personal configuration file -*- lexical-binding: t; no-byte-compile: t; -*-


;;; garbage-collection
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; `file-name-handler-alist' is consulted on every `require', `load' and various
;; path/io functions. You get a minor speed up by nooping this. However, this
;; may cause problems on builds of Emacs where its site lisp files aren't
;; byte-compiled and we're forced to load the *.el.gz files (e.g. on Alpine)

(unless (daemonp)
  (defvar doom--initial-file-name-handler-alist file-name-handler-alist)
  (setq file-name-handler-alist nil)
  ;; Restore `file-name-handler-alist' later, because it is needed for handling
  ;; encrypted or compressed files, among other things.
  (defun doom-reset-file-handler-alist-h ()
    ;; Re-add rather than `setq', because changes to `file-name-handler-alist'
    ;; since startup ought to be preserved.
    (dolist (handler file-name-handler-alist)
      (add-to-list 'doom--initial-file-name-handler-alist handler))
    (setq file-name-handler-alist doom--initial-file-name-handler-alist))
  (add-hook 'emacs-startup-hook #'doom-reset-file-handler-alist-h)
  (add-hook 'after-init-hook '(lambda ()
                                 ;; restore after startup
                                 (setq gc-cons-threshold 16777216
                                       gc-cons-percentage 0.1)))
)
;; Ensure Doom is running out of this file's directory
(setq user-emacs-directory (file-truename (file-name-directory load-file-name)))

(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

(let ((file-name-handler-alist nil)
      (gc-cons-threshold 100000000)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)


;;; package.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

:: This allows package-list-packages to show available packages, just a reference.

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))


;;; local-libraries
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(add-to-list 'load-path "~/.emacs.d/elisp/local/libraries")

(require 'lacarte)
(require 'font-lock+)
(require 'sr-speedbar)
(require 'dired+)
(require 'info+)
(require 'lusty-explorer)


;;; local-packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(add-to-list 'load-path "~/.emacs.d/elisp/local/packages/aweshell")
(add-to-list 'load-path "~/.emacs.d/elisp/local/packages/awesome-tab")

(require 'aweshell)
(require 'awesome-tab)

(add-to-list 'load-path "~/.emacs.d/elisp/local/packages/sunrise-commander")

(require 'sunrise)
(require 'sunrise-buttons)
(require 'sunrise-checkpoint)
(require 'sunrise-loop)
(require 'sunrise-mirror)
(require 'sunrise-modeline)
(require 'sunrise-popviewer)
(require 'sunrise-tabs)
(require 'sunrise-tree)


;;; custom-file setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
  (when (file-exists-p custom-file)
    (load custom-file))
    
    
;;; server-start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    

;; When config gets stable, using emacs server may be more convenient
;; (require 'server)
;; (unless (server-running-p)
;;   (server-start))


;;; cmd-popup reference sheet.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun cmd-popup ()
  "Popup of kbd cmds cheat sheet"
  (interactive)
  (find-file "~/.emacs.d/elisp/emacs-cmds-popup-reference.org"))

(global-set-key (kbd "C-c k r") 'cmd-popup)


;;; Emacs configuration files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/elisp")

(add-to-list 'load-path "~/.emacs.d/elisp/configs")


(load "emacs-config")

















































