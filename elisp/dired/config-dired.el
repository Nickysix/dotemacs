;;; config-dired.el --- Personal configuration file -*- lexical-binding: t; no-byte-compile: t; -*-


;; * DIRED-MODE


;; This is a package, but not really an external one because
;; it's built into Emacs, by doing this you can easily jump
;; to dired while browsing for files with C-j.

(require 'dired-x)

(use-package dired-x
    :init (setq-default dired-omit-files-p t)
    :config
    (add-to-list 'dired-omit-extensions ".DS_Store"))
    
    
;; Also built into Emacs, this is what provides the chgrp, chown,
;; chmod functionality as well as some other builtins

(require 'dired-aux)    
    
;; * wdired
    
;; Another awesome extension for Dired that's built into Emacs,
;; this makes the dired buffer writable, you can hit C-x C-q to enter the mode,
;; make your changes and then hit C-c C-c to apply them, or C-c ESC to discard them.    
    
    
;; * dired+

;; Dired+ provides additional fontification (colors),
;; enhances some of the existing functionality (like the i command),
;; allows operating on all files or files and directories in the
;; directory and adds the diredp-hide-details-initially-flag that
;; allows hiding or showing details automatically when opening new Dired buffers.

    
;; By default dired will list files and directories
;; in alphabetical order. If you would rather have
;; directories at the top of the file and files below,
;; you can set ls-lisp-dirs-first to t and they will
;; always be at the top.

(setq ls-lisp-dirs-first t)

;; When deleting or copying files,
;; you can have dired default to 
;; acting recursively by setting:

(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

;; Just like with ls, if you want an "@"
;; appended to the end of file names if
;; they're symlinks, you can set the following:

(setq dired-ls-F-marks-symlinks t)

;; This changes the switches that are passed to the
;; ls command when a dired buffer has been generated.
;; On Linux I like to set mine to:

(setq dired-listing-switches "-lFaGh1v --group-directories-first")
;;(setq dired-listing-switches "-GAlh --group-directories-first")













(setq
 delete-by-moving-to-trash          t        ; in dired mode
 dired-auto-revert-buffer           t        ; automatically revert buffer
 dired-clean-up-buffers-too         t        ; kill buffers for deleted files
 dired-dwim-target                  t        ; guess target directory
 dired-keep-marker-copy             nil      ; don't mark copied files
;; dired-listing-switches             "-lFaGh1v --group-directories-first"
;; dired-listing-switches             "-GAlh --group-directories-first"
;; dired-recursive-copies             'always  ; don't ask me, just do it
;; dired-recursive-deletes            'always  ; ^
 image-dired-show-all-from-dir-max-files 127 ; a bit more
 wdired-allow-to-change-permissions t        ; change permissions with Dired
 ztree-dir-filter-list              nil      ; don't hide anything
 ztree-draw-unicode-lines           t)       ; I like Unicode













































