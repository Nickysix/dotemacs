(use-package imenu-anywhere
  :general
  ("C-." 'imenu-anywhere))

(use-package popup-imenu
  :general
  ("C-e" 'popup-imenu)
  (:keymaps 'popup-isearch-keymap
	    "C-e" 'popup-isearch-cancel)	    
  :init
  (setq popup-imenu-position 'center)
  (setq popup-imenu-style 'indent))

(use-package imenu-list
  :general
  ("C-'" 'imenu-list-smart-toggle))
