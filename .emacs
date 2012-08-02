;LoadPath
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path))

;Color-theme
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     ;(color-theme-arjen)))
     (color-theme-ld-dark)))

(setq default-directory "~/workspace/")
(set-face-attribute 'default nil :height 90)

;Default Tramp protocol: (ssh)
;(setq tramp-default-method "ssh")

;Don't show intro
(setq inhibit-startup-message t)
;Don't create backup files
(setq make-backup-files nil)

(defalias 'wm 'whitespace-mode)
(defalias 'rs 'replace-string)
(defalias 'll 'goto-line)
(defalias 'cws' 'delete-trailing-whitespace)

;No menu-bar
(menu-bar-mode -1)
(tool-bar-mode -1)

;Better buffer switching
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;Better answer
(fset 'yes-or-no-p 'y-or-n-p)

;Show line number
(global-linum-mode t)
;Tab width
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;Better copy-paste
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

;YAML mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;Markdown mode
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\.md$" . markdown-mode))

;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(add-to-list 'auto-mode-alist '("\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("ERB$" . html-mode))

;; Zencoding
(require 'zencoding-mode)
;; Auto-start on any markup modes
(add-hook 'sgml-mode-hook 'zencoding-mode)

;; Yasnippets
;;(add-to-list 'load-path
;;              "~/.emacs.d/yasnippet")
;;(require 'yasnippet)
;;(yas/global-mode 1)

;; -----------------------------------------------------------------------------
;; Git support
;; -----------------------------------------------------------------------------
(load "git.el")
(load "git-blame.el")
(load "vc-git.el")
(add-to-list 'vc-handled-backends 'GIT)

;; CEDET
(load-file "/usr/share/emacs/site-lisp/cedet/common/cedet.el")
;; Enable EDE (Project Management) features
(global-ede-mode 1)
;; * This enables even more coding tools such as intellisense mode,
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
(semantic-load-enable-gaudy-code-helpers)

;; ECB
(add-to-list 'load-path "/usr/share/emacs/site-lisp/ecb")
(require 'ecb-autoloads)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
'(ecb-source-path (quote ("~/workspace")))
'(ecb-tip-of-the-day nil)
'(ecb-tree-buffer-style (quote ascii-guides))
'(ecb-layout-define "left2"))
