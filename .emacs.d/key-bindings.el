(require 'compile)
;; Ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Better copy-paste
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)

;; Backspace deleting
(global-set-key (kbd "C-.") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

;; Move Region
(global-set-key (kbd "M-p") 'move-region-up)
(global-set-key (kbd "M-n") 'move-region-down)

;; Aliases
(defalias 'wm 'whitespace-mode)
(defalias 'rs 'replace-string)
(defalias 'll 'goto-line)
(defalias 'rbhash 'ruby-update-hash)
; do this on save
(defalias 'cws' 'delete-trailing-whitespace)
