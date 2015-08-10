;;; key-bindings --- My set of custom key-bindings for Emacs
;;; Commentary:
;;; No comments
;;; Code:
(require 'compile)
;; Ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Better copy-paste
(global-set-key (kbd "C-w") 'clipboard-kill-region)
(global-set-key (kbd "M-w") 'clipboard-kill-ring-save)
(global-set-key (kbd "C-y") 'clipboard-yank)

;; Backspace deleting
(global-set-key (kbd "C-.") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

;; Duplicate line
(global-set-key (kbd "C-c d") 'duplicate-line)
;; Vim's Esc-o
(global-set-key (kbd "C-c o") 'next-line-and-indent)

;; Move Region
(global-set-key (kbd "M-p") 'move-region-up)
(global-set-key (kbd "M-n") 'move-region-down)
;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Search
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)

;; Comment
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)

;; Reload files
(global-set-key (kbd "C-c r") 'revert-buffer-no-confirm)

;; Smex (Built on top of Ido, it provides a convenient interface to
;; your recently and most frequently used commands)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
;;(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Switch windows with ace-window
(global-set-key (kbd "C-x x o") 'ace-window)


;; Aliases
(defalias 'wm 'whitespace-mode)
(defalias 'rs 'replace-string)
(defalias 'll 'goto-line)
(defalias 'rbhash 'ruby-update-hash)
(defalias 'evb 'eval-buffer)
(defalias 'cws 'delete-trailing-whitespace)
(provide 'key-bindings)
;;; key-bindings ends here
