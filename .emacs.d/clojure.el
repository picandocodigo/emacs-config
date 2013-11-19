(defvar my-packages '(
                      clojure-mode
                      clojure-test-mode
                      cider))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
