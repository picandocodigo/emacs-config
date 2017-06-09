; list the packages you want
(setq package-list '(
         coffee-mode
         inf-ruby
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
         rspec-mode
         rvm
         hiwin
         fancy-narrow
         narrow-reindent
         ibuffer-vc
         emojify
         all-the-icons
         )
      )

; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
       ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

; Emojify
(add-hook 'after-init-hook #'global-emojify-mode)

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
;LoadPath
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path)
  )
(setq load-path (append (list "~/.emacs.d/packages") load-path))

(require 'tramp)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;Color-theme
(load-theme 'challenger-deep t)
;Active frame
(require 'hiwin)
(hiwin-activate)
(set-face-background 'hiwin-face "#000000")

(setq default-directory "~/workspace/")
(set-face-attribute 'default nil :height 100)

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

;; IBUFFER
;;Better buffer switching
(autoload 'ibuffer "ibuffer" "List buffers." t)
;; Ensure ibuffer opens with point at the current buffer's entry.
(defadvice ibuffer
    (around ibuffer-point-to-most-recent) ()
    "Open ibuffer with cursor pointed to most recent buffer name."
    (let ((recent-buffer-name (buffer-name)))
      ad-do-it
      (ibuffer-jump-to-buffer recent-buffer-name)))
(ad-activate 'ibuffer)
(setq ibuffer-expert t)
(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-auto-mode 1)
             (ibuffer-switch-to-saved-filter-groups "home")))
;; ibuffer-vc
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))


;; ido mode
(require 'ido)
(ido-mode 1)
(ido-everywhere 1)
(require 'ido-ubiquitous)
(ido-ubiquitous-mode 1)

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
(load "custom_libs/single-quote.el")
;; nyan-mode
(load "repos/nyan-mode/nyan-mode.el")
(nyan-mode)
(setq-default nyan-wavy-trail t)
(nyan-start-animation)
;; Duplicate lines without using C-k C-y
(load "duplicate-lines")
;; Programming
(load "programming")
;; Org-mode
(load "orgmode")
;; Custom Mode line
(load "modeline-custom")
;;Keys
(load "key-bindings")

 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
