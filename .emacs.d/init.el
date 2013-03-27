;LoadPath
(let ((default-directory "~/.emacs.d/"))
  (normal-top-level-add-subdirs-to-load-path)
  )
;;Keys
(load-library "~/.emacs.d/key-bindings")
;;Move region
(load-library "~/.emacs.d/move-region")

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

;Default Tramp protocol: (ssh)
;(setq tramp-default-method "ssh")

;Don't show intro
(setq inhibit-startup-message t)
;Don't create backup files
(setq make-backup-files nil)
;No menu-bar
(menu-bar-mode -1)
(tool-bar-mode -1)
;Better answer
(fset 'yes-or-no-p 'y-or-n-p)
;Show line number
(global-linum-mode t)
;Tab width
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

;Better buffer switching
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; ido mode
(ido-mode t)

;auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;xmp -> comments the return of a method (needs rcodetools gem) (M-') 
;; Paredit
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'ruby-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))

;PHP
(add-to-list 'load-path "~/.emacs.d/")
(require 'php-mode)

(add-hook 'php-mode-hook'
  (lambda ()
  (c-set-offset 'arglist-intro '-)
  (c-set-offset 'arglist-close 0)))

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

;; JS indenting
(setq js-indent-level 2)

;; Yasnippets
(add-to-list 'load-path
              "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)

;; -----------------------------------------------------------------------------
;; Git support
;; -----------------------------------------------------------------------------
;;Add magit

;; Get Flymake

;; Lua mode
(add-to-list 'load-path "~/.emacs.d/lua-mode/lua-mode.el")
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; Write backup files to own directory
(setq backup-directory-alist
  `(("." . ,(expand-file-name
    (concat user-emacs-directory "backups")))))



;; testing
;; C-c t m - one test, f - file, r - rake

;; visit-source

;; acute-to-html
(load "custom_libs/acute-to-html.el")
;; update ruby-hashes
(load "custom_libs/ruby-update-hash.el")


;; Use C-J for newlines in code

;; Add something to duplicate lines without using C-k C-y
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)