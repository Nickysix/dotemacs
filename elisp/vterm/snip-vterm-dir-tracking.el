

;;; Directory tracking functions

(defun vterm--rename-buffer-as-title (title)
  (let ((dir (string-trim-left (concat (nth 1 (split-string title ":")) "/"))))
    (cd-absolute dir)
  (rename-buffer (format "term %s" title)))
(add-hook 'vterm-set-title-functions 'vterm--rename-buffer-as-title)






(defun vterm--cd-to-directory-in-title (title)
  "Change into directory extracted from path info in TITLE.

The format of TITLE is expected to be '<user>@<host>:path'

TITLE is based on the xterm style window title, set via the shell. See sections
3 and 4 on this page for how to set the TITLE via the shell:
http://www.faqs.org/docs/Linux-mini/Xterm-Title.html"
  (let ((dir (concat (nth 1 (split-string title ":")) "/")))
    (cd dir)))
(add-hook 'vterm-set-title-functions #'vterm--cd-to-directory-in-title)