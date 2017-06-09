;; Mode line setup
;; Based on: http://amitp.blogspot.com/2011/08/emacs-custom-mode-line.html
(setq-default
 mode-line-format
 '(; Position, including warning for 80 columns
   (:propertize mode-line-position-face)

   ; emacsclient [default -- keep?]
   mode-line-client
   ; read-only or modified status
   (:eval
    (cond (buffer-read-only
           (propertize "  " 'face 'mode-line-read-only-face))
          ((buffer-modified-p)
           (propertize "  " 'face 'mode-line-modified-face))
          (t " " )))
   " %["
   (:propertize mode-name
                 face mode-line-mode-face)
   "%] "
   (format " %s"
    (propertize icon
                'help-echo (format "Major-mode: `%s`" major-mode)
                'face `(:height 1.2 :family ,(all-the-icons-icon-family-for-buffer))))
   ; directory and buffer/file name
   (:propertize (:eval (shorten-directory default-directory 5))
                face mode-line-folder-face)
   (:propertize "%b"
                face mode-line-filename-face)
   ; narrow [default -- keep?]
   " %n"
   ; mode indicators: vc, recursive edit, major mode, minor modes, process, global
   " "(vc-mode vc-mode)"  "
   ; nyan-mode uses nyan cat as an alternative to %p
   (:eval (when nyan-mode (list (nyan-create))))
   (global-mode-string global-mode-string)
   ))

;; Helper function
(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

;; Extra mode line faces
(make-face 'mode-line-read-only-face)
(make-face 'mode-line-modified-face)
(make-face 'mode-line-folder-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-mode-face)
(make-face 'mode-line-minor-mode-face)
(make-face 'mode-line-process-face)
(make-face 'mode-line-80col-face)

(set-face-attribute 'mode-line nil
    :foreground "gray60" :background "gray20"
    :inverse-video nil
    :box '(:line-width 1 :color "gray20" :style nil))
(set-face-attribute 'mode-line-inactive nil
    :foreground "gray80" :background "gray40"
    :inverse-video nil
    :box '(:line-width 1 :color "gray40" :style nil))

(set-face-attribute 'mode-line-read-only-face nil
    :inherit 'mode-line-face
    :foreground "#33f"
    :background "#001"
    :box '(:line-width 2 :color "#33f"))
(set-face-attribute 'mode-line-modified-face nil
    :inherit 'mode-line-face
    :foreground "#f00"
    :background "#000"
    :box '(:line-width 2 :color "#700"))
(set-face-attribute 'mode-line-folder-face nil
    :inherit 'mode-line-face
    :foreground "#6b7c50"
    :background "#000")
(set-face-attribute 'mode-line-filename-face nil
    :inherit 'mode-line-folder-face
    :foreground "#b8c12b"
    :weight 'bold)
(set-face-attribute 'mode-line-mode-face nil
    :inherit 'mode-line-face
    :foreground "#ff0")
(set-face-attribute 'mode-line-minor-mode-face nil
    :inherit 'mode-line-mode-face
    :foreground "gray70"
    :height 80)
(set-face-attribute 'mode-line-process-face nil
    :inherit 'mode-line-face
    :foreground "#718c00")
