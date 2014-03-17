;LoadPath
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path)
  )
(setq load-path (append (list "~/.emacs.d") load-path))

(require 'tramp)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;Color-theme
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     ;(color-theme-gray30)))
     ;(color-theme-arjen)))
     (color-theme-ld-dark)))
     ;(color-theme-kingsajz)))

(setq default-directory "~/workspace/")
(set-face-attribute 'default nil :height 90)

(delete-selection-mode 1)

;Don't show intro
(setq inhibit-startup-message t)
;No menu-bar
(menu-bar-mode -1)
(tool-bar-mode -1)
;Show line number
(global-linum-mode t)
;Highlight current line
(global-hl-line-mode +1)
;Tab width
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

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
(ido-mode t)

;Don't create backup files
(setq make-backup-files nil)
(setq backup-directory-alist
  `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
  `((".*" ,temporary-file-directory t)))
;; Write backup files to own directory
(setq backup-directory-alist
  `(("." . ,(expand-file-name
    (concat user-emacs-directory "backups")))))

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
                      ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(setq ac-source-yasnippet nil)
