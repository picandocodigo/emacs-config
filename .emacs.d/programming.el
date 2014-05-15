;; Magit
(setq load-path (append (list "~/.emacs.d/magit") load-path))
(require 'magit)

;; Autopair
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Ruby
(load-library "ruby-end")
(require 'ruby-end)

;HAML mode
(require 'haml-mode)
(add-hook 'haml-mode-hook
  (lambda ()
    (setq indent-tabs-mode nil)
      (define-key haml-mode-map "\C-m" 'newline-and-indent)))
(add-to-list 'auto-mode-alist '("haml" . haml-mode))

;YAML mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;Markdown mode
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\.md$" . markdown-mode))

(require 'handlebars-mode)
(add-to-list 'auto-mode-alist '("\.hb$" . handlebars-mode))

;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(add-to-list 'auto-mode-alist '("\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Thorfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("ERB$" . html-mode))

;; Sass
(add-to-list 'auto-mode-alist '("\.scss$" . css-mode))
(add-to-list 'auto-mode-alist '("\.sass$" . css-mode))

;; JavaScript
(setq js-indent-level 2)

;; CSS
(setq css-indent-level 2)

;; PHP
(require 'php-mode)

;; Yasnippets
(require 'yasnippet)
(yas/global-mode 1)

;; Projectile
(require 'projectile)
(projectile-global-mode)

;; Beautify JSON:
(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
      "python -mjson.tool" (current-buffer) t)))

;xmp -> comments the return of a method (needs rcodetools gem) (M-')

;; testing
;; C-c t m - one test, f - file, r - rake

;; visit-source
