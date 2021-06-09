;; * org-roam :from :github jinnovation dotemacs

(use-package org-roam
  :straight t
  :hook
  (after-init . org-roam-mode)
  :init
  (setq org-roam-directory "~/roam")
  :custom
  (org-roam-tag-sources '(prop all-directories))
  :config
  (setq org-roam-graph-viewer (if (eq system-type 'darwin) "open" nil))
  (add-to-list 'org-roam-capture-templates
               '("r"
                "reading"
                plain
                (function org-roam--capture-get-point)
                "%?"
                :file-name "reading/%<%Y%m%d%H%M%S>-${slug}"
                :head "#+title: ${title}\n\n* 作者\n  "
                :unnarrowed t))
  (with-eval-after-load 'pretty-hydra
    (pretty-hydra-define jjin-hydra-roam
      (:title (with-octicon "pencil" "Notes (Roam)" 1 -0.05))
      ("Find"
       (("f" org-roam-find-file "file"))))
    (bind-key "s-r" 'jjin-hydra-roam/body)))

;; TODO: Add to jjin-hydra-roam a key to open the graph in browser
(use-package org-roam-server
  :after org-roam
  :straight t
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))