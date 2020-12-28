(require 'package)
(setq package-archives
	  '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
	    ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(package-initialize)

(use-package evil
  :ensure t
  :init ;; tweak evil's configuration before loading it
  (setq evil-search-module 'evil-search)
  (setq evil-ex-complete-emacs-commands nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-shift-round nil)
  (setq evil-want-C-u-scroll t)
  :config ;; tweak evil after loading it
  (evil-mode))

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
  :config
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
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

(use-package gruber-darker-theme
  :ensure t
  :init
  (load-theme 'gruber-darker t))

(provide 'init-package)
