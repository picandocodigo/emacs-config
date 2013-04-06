;LoadPath
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path)
  )
(setq load-path (append (list "~/.emacs.d") load-path))


;Color-theme
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     ;(color-theme-arjen)))
     (color-theme-gray30)))
     ;(color-theme-ld-dark)))
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

;Better answer
(fset 'yes-or-no-p 'y-or-n-p)
;Better buffer switching
(autoload 'ibuffer "ibuffer" "List buffers." t)

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

;;Keys
(load "key-bindings")
;;Move region
(load "move-region")
;; acute-to-html
(load "custom_libs/acute-to-html.el")
;; update ruby-hashes
(load "custom_libs/ruby-update-hash.el")
;; Duplicate lines without using C-k C-y
(load "duplicate-lines")
;; Programming
(load "programming")
