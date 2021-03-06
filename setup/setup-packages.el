(require 'use-package)
(setq use-package-always-ensure t)
(setq use-package-verbose t)

(use-package diminish)

(use-package color-theme-sanityinc-tomorrow
  :config
  ;; (load-theme 'sanityinc-tomorrow-night t)
  (load-theme 'sanityinc-tomorrow-bright t)
  )

(use-package buffer-move
  :bind (("<C-S-up>"	. 'buf-move-up)
		 ("<C-S-down>"	. 'buf-move-down)
		 ("<C-S-left>"	. 'buf-move-left)
		 ("<C-S-right>"	. 'buf-move-right)))

(use-package flycheck
  :disabled
  :diminish
  :config
  (add-hook 'c-mode-common-hook 'flycheck-mode))
(use-package cl
  :disabled
  :disabled)
(use-package slime
  :disabled
  :config
  (setq inferior-lisp-program "sbcl")
  (setq slime-contribs '(slime-fancy)))

(use-package company
  :diminish
  :config
  (add-hook 'prog-mode-hook 'company-mode))

(use-package company-c-headers
  :config
  (add-to-list 'company-backends 'company-c-headers)
  (if (string-equal system-type "windows-nt")
	  (setq company-c-headers-path-system '("D:\\MinGW\\include"))))

(use-package magit
  :bind ("C-x g" . 'magit-status))

(use-package ivy
  :bind ("C-x b" . 'ivy-switch-buffer)
  :config
  (setq ivy-use-selectable-prompt t))

(use-package swiper
  :disabled
  :bind ("C-s" . 'swiper))

(use-package counsel
  :bind (("M-x"		. 'counsel-M-x)
		 ("C-x C-f"	. 'counsel-find-file)
		 ("C-h f"	. 'counsel-describe-function)
		 ("C-h v"	. 'counsel-describe-variable)
		 ("C-h u"	. 'counsel-unicode-char)))

(use-package php-mode)
(use-package company-php)
(use-package ac-php)

(use-package web-mode)

(use-package projectile
  :bind ("C-c p" . 'projectile-command-map)
  :config
  (setq projectile-completion-system 'ivy))

(use-package elpy
  :ensure t
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  (setq elpy-rpc-python-command "/usr/bin/python3"))

(provide 'setup-packages)
