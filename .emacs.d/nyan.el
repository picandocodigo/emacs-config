(defun nyan ()
  (interactive)
  (add-to-list 'load-path "~/.emacs.d/nyan-mode")
  (require 'nyan-mode)
  (setq-default nyan-wavy-trail t)

  (nyan-mode)
  (nyan-start-animation)
)