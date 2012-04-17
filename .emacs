;LoadPath
(add-to-list 'load-path' "~/.emacs.d/")
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))
;Color-theme
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-arjen)))

(setq default-directory "~/workspace/")

;Default Tramp protocol: (ssh)
;(setq tramp-default-method "ssh")

;Don't show intro
(setq inhibit-startup-message t)
;Don't create backup files
(setq make-backup-files nil)

;Always show whitespaces
;(require 'whitespace)
;(global-whitespace-mode t)

;No menu-bar
(menu-bar-mode -1)

;Better buffer switching
(global-set-key (kbd "\C-x\C-b") 'buffer-menu-other-window)

;Better answer
(fset 'yes-or-no-p 'y-or-n-p)

;Show line number
(global-linum-mode t)
;Tab width
(setq-default tab-width 2)

;auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;Better copy-paste
;(global-set-key [(shift delete)] 'clipboard-kill-region)
;(global-set-key [(control insert)] 'clipboard-kill-ring-save)
;(global-set-key [(shift insert)] 'clipboard-yank)
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)

;HAML mode
(require 'haml-mode)
(add-hook 'haml-mode-hook
					(lambda ()
						(setq indent-tabs-mode nil)
						(define-key haml-mode-map "\C-m" 'newline-and-indent)))