

;;Remove a Keybinding
;;To unset a keybinding, set it to nil.

;; unset a key
;;(global-set-key (kbd "C-b") nil)
;;Or use global-unset-key.

;; unset a key
;;(global-unset-key (kbd "C-b"))
;;Find the Command of a Given Key
;;Alt+x describe-key, then type the key combination.

;;List Current Major Mode's Keys
;;Alt+x describe-mode.

;;List ALL Keybinding
;;Alt+x describe-bindings.

;;Each major mode or minor mode usually add or change some keys. 
;;So, key list generated is specific to current buffer.




We could map 'n' to next-line, instead of forward-line.
next-line, previous-line obey column width, forward-line snaps to column 0 and proceeds.


;; add view mode keybindings
(use-package view
  :config (setq view-read-only t) ;; C-x C-q can also toggle view-mode
  :straight nil
  :bind (("<f13>" . view-mode) ;; remap R-Shift to F 13
	 :map view-mode-map
	 ("n" . forward-line)
	 ("p" . previous-line)))


;; make sure the cursor is changed visually
(setq-default cursor-type 'bar)
(add-hook 'view-mode-hook (defun view-mode-change-cursor-type-hook ()
            (setq cursor-type (if view-mode 'box 'bar))))
;; NB: using a defun in the hook, so debugging is easier














;; Unbind unneeded keys
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "M-z") nil)
(global-set-key (kbd "C-x C-z") nil)
(global-set-key (kbd "M-/") nil)





(use-package evil-escape
   :init
   (setq-default evil-escape-delay 0.2)
   (setq-default evil-escape-key-sequence "jj")
   :config
   (evil-escape-mode -1))

(use-package evil
  :init
  (progn
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil))
  :config
  (evil-mode -1))




;;; ryo-madal configuration:


(use-package ryo-modal
  :commands ryo-modal-mode
  :bind ("C-c SPC" . ryo-modal-mode)
  :config
  (define-key ryo-modal-mode-map (kbd ",") 'ryo-modal-repeat)
  (add-to-list 'ryo-modal-bindings-list '("," "ryo-modal-repeat"))

  (ryo-modal-keys
   ("q" ryo-modal-mode)
   ("h" backward-char)
   ("j" next-line)
   ("k" previous-line)
   ("l" forward-char))

  (ryo-modal-keys
   ;; First argyment to ryo-modal-keys may be a list of keywords.
   ;; These keywords will be applied to all keybindings.
   (:norepeat t)
   ("0" "M-0")
   ("1" "M-1")
   ("2" "M-2")
   ("3" "M-3")
   ("4" "M-4")
   ("5" "M-5")
   ("6" "M-6")
   ("7" "M-7")
   ("8" "M-8")
   ("9" "M-9")))
   
   
   
(use-package modalka
  :ensure t
  :demand t
  :bind* (("C-z" . modalka-mode))
  :diminish (modalka-mode . "μ")
  :init
  (setq modalka-cursor-type 'box)
  :config
  (global-set-key (kbd "<escape>") #'modalka-mode)
  (modalka-global-mode -1))

(modalka-define-kbd "W" "M-w")
(modalka-define-kbd "Y" "M-y")
(modalka-define-kbd "a" "C-a")
(modalka-define-kbd "b" "C-b")
(modalka-define-kbd "e" "C-e")
(modalka-define-kbd "f" "C-f")
(modalka-define-kbd "g" "C-g")
(modalka-define-kbd "n" "C-n")
(modalka-define-kbd "p" "C-p")
(modalka-define-kbd "w" "C-w")
(modalka-define-kbd "y" "C-y")
(modalka-define-kbd "SPC" "C-SPC")
(modalka-define-kbd "s" "C-x C-s")   
   
   
   
   
   
   
   
   
   
   
   



;;; modalka-mode configuration:

(modalka-define-kbd "W" "M-w")
(modalka-define-kbd "Y" "M-y")
(modalka-define-kbd "a" "C-a")
(modalka-define-kbd "b" "C-b")
(modalka-define-kbd "e" "C-e")
(modalka-define-kbd "f" "C-f")
(modalka-define-kbd "g" "C-g")
(modalka-define-kbd "n" "C-n")
(modalka-define-kbd "p" "C-p")
(modalka-define-kbd "w" "C-w")
(modalka-define-kbd "y" "C-y")
(modalka-define-kbd "SPC" "C-SPC")


(modalka-define-kbd "2" "C-2")

(define-key modalka-mode-map (kbd "Q") #'my-command)

(global-set-key (kbd "<return>") #'modalka-mode)

(modalka-global-mode 1)

(add-to-list 'modalka-excluded-modes 'magit-status-mode)

(add-hook 'text-mode-hook #'modalka-mode)
(add-hook 'prog-mode-hook #'modalka-mode)

(setq-default cursor-type '(bar . 1))
(setq modalka-cursor-type 'box)















































