






(defun display-startup-echo-area-message ()
  "Override the normally tedious error message."
  (message "Welcome back."))
  
  
(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode) default-directory (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(bind-key "C-c P" #'copy-file-name-to-clipboard)  
  
  
(defun kill-all-buffers ()
  "Close all buffers."
  (interactive)
  ;; (maybe-unset-buffer-modified)
  (save-some-buffers)
  (let ((kill-buffer-query-functions '()))
    (mapc 'kill-buffer (buffer-list))))

(defun init ()
  "open init file with shift f12"
  (interactive)
  (find-file "~/.emacs.d/elisp/emacs-config.el"))

(global-set-key [(shift f12)] 'init)

(defun refile ()
  "open gtd.org file with shift f11"
  (interactive)
  (find-file "~/norg/refile.org"))

(global-set-key (kbd "C-c r") 'refile)
