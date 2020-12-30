(defun load-all-packages ()


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package evil
  :ensure t
  :init
  (progn
    (evil-mode t)
    (setq evil-search-module 'evil-search)
    (setq evil-ex-complete-emacs-commands nil)
    (setq evil-vsplit-window-right t)
    (setq evil-split-window-below t)
    (setq evil-shift-round nil)
    (setq evil-want-C-u-scroll t)
    (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state))
  :config
  (progn
    (use-package evil-leader
      :ensure t
      :init
      (progn
        (global-evil-leader-mode)
        (setq evil-leader/in-all-states 1)
        (evil-leader/set-leader "<SPC>")
        (evil-leader/set-key "SPC" 'helm-M-x)
        (evil-leader/set-key "c" 'compile)
        (evil-leader/set-key "rf" 'helm-recentf)
        (evil-leader/set-key "ff" 'helm-find-files)
        (evil-leader/set-key "gg" 'magit-status)
        (evil-leader/set-key "sb" 'ido-switch-buffer)
        (evil-leader/set-key "oc" 'org-capture)
        (evil-leader/set-key "k" 'ido-kill-buffer)))
    (use-package evil-surround
      :ensure t
      :config
      (progn
        (global-evil-surround-mode)))
    (use-package evil-escape
      :ensure t
      :config
      (progn
        (evil-escape-mode)
        (setq-default evil-escape-key-sequence "tn")))
    (defvar evil-emacs-state-cursor)
    (defvar evil-normal-state-cursor)
    (defvar evil-visual-state-cursor)
    (defvar evil-insert-state-cursor)
    (defvar evil-replace-state-cursor)
    (defvar evil-operator-state-cursor)
    (defvar evil-normal-state-map)
    (defvar evil-insert-state-map)
    (setq evil-emacs-state-cursor '("red" box))
    (setq evil-normal-state-cursor '("green" box))
    (setq evil-visual-state-cursor '("orange" box))
    (setq evil-insert-state-cursor '("red" bar))
    (setq evil-replace-state-cursor '("red" bar))
    (setq evil-operator-state-cursor '("red" ))
    (define-key evil-normal-state-map "p" 'evil-paste-after)
    (define-key evil-normal-state-map "P" 'evil-paste-before)
    (define-key evil-normal-state-map (kbd "C-s") 'save-buffer)
    (define-key evil-normal-state-map (kbd "C-]") (kbd "\\ M-."))))

  (use-package company
    :ensure t
    :init
    (add-hook 'after-init-hook 'global-company-mode)
    :config
    (setq company-dabbrev-downcase 0)
    (setq company-idle-delay 0.1)
    (setq company-minimum-prefix-length 1)
    (setq company-tooltip-align-annotations t))
  
  (use-package helm
    :ensure t
    :init
    (require 'helm-config)
    :bind
    (("M-x" . helm-M-x)
     ("C-x C-f" . helm-find-files)
     )
    :config
    (helm-mode 1))
  
  (use-package projectile
    :config
    (projectile-mode))
  
  (use-package helm-projectile
    :config
    (helm-projectile-on))
  
  (use-package which-key
    :config
    (which-key-mode))
  
  (use-package magit
    :ensure t)
  
  (use-package smartparens
    :ensure t
    :init
    (smartparens-global-mode))
  
  (use-package doom-themes
    :ensure t
    :init
    (load-theme 'doom-one t))
  )

(defun init-packages ()
  (require 'package)
  (setq package-archives
  	  '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
  	    ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
  (package-initialize)
  (load-all-packages))

(provide 'init-package)
