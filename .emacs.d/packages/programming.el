;; Magit
;;(setq load-path (append (list "~/.emacs.d/magit") load-path))
;;(require 'magit)

;; Autopair
(require 'autopair)
;; enable autopair in all buffers
(autopair-global-mode)

;; Autocomplete
(require 'auto-complete)
(global-auto-complete-mode t)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Ruby
(load-library "ruby-end")
(require 'ruby-end)
(require 'rspec-mode)
(setq rspec-use-rake-when-possible t)
(require 'rvm)
(rvm-use-default)

;; ERB:
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("ERB$" . web-mode))

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

;; Sass
(add-to-list 'auto-mode-alist '("\.scss$" . css-mode))
(add-to-list 'auto-mode-alist '("\.sass$" . css-mode))
;; JavaScript
(setq js-indent-level 2)
;; CSS
(setq css-indent-level 2)

;; PHP
(require 'php-mode)
(add-hook 'php-mode-hook 'my-php-mode-hook)
(defun my-php-mode-hook ()
  "My PHP mode configuration."
  (setq indent-tabs-mode nil
        tab-width 2
        c-basic-offset 2))

;; Web-mode
(defun web-mode-indentation-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
)
(add-hook 'web-mode-hook  'web-mode-indentation-hook)

;; Yasnippets
(require 'yasnippet)
(yas/global-mode 1)

;; Beautify JSON:
(defun beautify-json ()
  (interactive)
  (let ((b (if mark-active (min (point) (mark)) (point-min)))
        (e (if mark-active (max (point) (mark)) (point-max))))
    (shell-command-on-region b e
      "python -mjson.tool" (current-buffer) t)))

;; Narrowing modes:
(require 'narrow-reindent)
(narrow-reindent-mode)
(require 'fancy-narrow)
(fancy-narrow-mode)

;;xmp -> comments the return of a method (needs rcodetools gem) (M-')

;; testing
;; C-c t m - one test, f - file, r - rake

;; visit-source
