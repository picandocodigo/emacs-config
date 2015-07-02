;LoadPath
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path)
  )
(setq load-path (append (list "~/.emacs.d/packages") load-path))

(require 'tramp)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;Color-theme
(load-theme 'deeper-blue t)

(setq default-directory "~/workspace/")
(set-face-attribute 'default nil :height 90)

(delete-selection-mode 1)

;Don't show intro
(setq inhibit-startup-message t)

;No menu-bar
(menu-bar-mode -1)
(tool-bar-mode -1)
;Highlight current line
(global-hl-line-mode +1)
;;Tab width
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)
;Show trailing whitespace
(defun show-ws-and-linum-on-files ()
  "Show trailing whitespace and line numbers on files only"
  (interactive)
  (when (not (eq buffer-file-name nil))
    (setq show-trailing-whitespace t)
    (linum-mode 1)))
(add-hook 'after-change-major-mode-hook 'show-ws-and-linum-on-files)

(global-visual-line-mode t)

;Better answer
(fset 'yes-or-no-p 'y-or-n-p)
;Better buffer switching
(autoload 'ibuffer "ibuffer" "List buffers." t)
;; Ensure ibuffer opens with point at the current buffer's entry.
(defadvice ibuffer
  (around ibuffer-point-to-most-recent) ()
  "Open ibuffer with cursor pointed to most recent buffer name."
  (let ((recent-buffer-name (buffer-name)))
    ad-do-it
    (ibuffer-jump-to-buffer recent-buffer-name)))
(ad-activate 'ibuffer)


;; ido mode
(require 'ido)
(ido-mode 1)
(ido-everywhere 1)
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

;; Smex (Built on top of Ido, it provides a convenient interface to
;; your recently and most frequently used commands)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
;;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;Backup files
(setq backup-directory-alist `((".*" . ,"~/.emacs.d/backups")))
(setq backup-by-copying t)

;; Auto-saves
(defvar my-auto-save-folder "~/.emacs.d/saves/");
(setq auto-save-list-file-prefix "~/.emacs.d/auto-save/.saves-")
(setq auto-save-file-name-transforms `((".*" ,my-auto-save-folder t)))
(setq tramp-auto-save-directory my-auto-save-folder)


;; Reload file
;; Source: http://www.emacswiki.org/emacs-en/download/misc-cmds.el
(defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive)
    (revert-buffer t))

;;Move region
(load "move-region")
;; acute-to-html
(load "custom_libs/acute-to-html.el")
;; update ruby-hashes
(load "custom_libs/ruby-update-hash.el")
;; next line and indent
(load "custom_libs/next-line-and-indent.el")
;; nyan cat
(load "nyan.el")
;; Duplicate lines without using C-k C-y
(load "duplicate-lines")
;; Programming
(load "programming")
;; Org-mode
(load "orgmode")

;;Keys
(load "key-bindings")

;; Marmalade packages
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

;; MELPA packages
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)
(defvar my-packages '(
                      phi-rectangle
                      coffee-mode
                      inf-ruby
                      php-mode
                      magit
                      paredit
                      yasnippet
                      flycheck
                      auto-complete
                      markdown-mode
                      alchemist
                      elixir-mode
                      web-mode
                      ido-ubiquitous
                      smex
                      ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
(setq ac-source-yasnippet nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
