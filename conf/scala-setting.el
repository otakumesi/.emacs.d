(el-get-bundle ensime/emacs-sbt-mode)
(el-get-bundle ensime/emacs-scala-mode)
(require 'scala-mode)
(require 'sbt-mode)

(el-get-bundle ensime)
(require 'ensime)

(add-to-list 'auto-mode-alist '("\\.ensime$" . sbt-mode))
(add-hook 'scala-mode-hook 'ensime)
(add-hook 'sbt-mode-hook 'ensime)

(defun scala-enable-eldoc ()
  "Show error message at point by Eldoc."
  (setq-local eldoc-documentation-function
              #'(lambda ()
                  (when (ensime-connected-p)
                    (let ((err (ensime-print-errors-at-point)))
                      (or (and err (not (string= err "")) err)
                          (ensime-print-type-at-point))))))
  (eldoc-mode +1))

(add-hook 'ensime-mode-hook #'scala-enable-eldoc)
