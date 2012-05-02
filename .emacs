;LoadPath
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
(defalias 'wm 'whitespace-mode)
(defalias 'rs 'replace-string)

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


;PHP
(add-to-list 'load-path "~/.emacs.d/")
(require 'php-mode)

;HAML mode
(require 'haml-mode)
(add-hook 'haml-mode-hook
					(lambda ()
						(setq indent-tabs-mode nil)
						(define-key haml-mode-map "\C-m" 'newline-and-indent)))

;Markdown
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(add-to-list 'auto-mode-alist '("\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))