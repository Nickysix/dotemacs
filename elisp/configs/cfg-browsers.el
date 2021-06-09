(use-package eww
  :defer t
  :init
  (progn
    (define-prefix-command 'my/eww-map)
    (define-key ctl-x-map "w" 'my/eww-map)

    (define-key my/eww-map "t" 'eww)
    (define-key my/eww-map "o" 'eww)
    (define-key my/eww-map "w" 'my/eww-wiki)
    (define-key my/eww-map "e" 'my/search-es-docs)

    (defun my/eww-wiki (text)
      "Function used to search wikipedia for the given text."
      (interactive (list (read-string "Wiki for: ")))
      (eww (format "https://en.m.wikipedia.org/wiki/Special:Search?search=%s"
                   (url-encode-url text)))))
  :config
  (progn
    (define-key eww-mode-map "o" 'eww)
    (define-key eww-mode-map "O" 'eww-browse-with-external-browser)
    (use-package eww-lnum
      :init
      (eval-after-load "eww"
        '(progn (define-key eww-mode-map "f" 'eww-lnum-follow)
                (define-key eww-mode-map "F" 'eww-lnum-universal))))))