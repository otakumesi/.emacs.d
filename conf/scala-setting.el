(el-get-bundle sbt-mode)
(el-get-bundle ensime/emacs-sbt-mode)
(el-get-bundle ensime/emacs-scala-mode)
(use-package scala-mode)
(use-package sbt-mode)

(el-get-bundle ensime/ensime-emacs)
(use-package ensime
  :ensure t)

(add-to-list 'exec-path "use/local/bin")

(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(defun scala/enable-eldoc ()
  "Show error message at point by Eldoc."
  (setq-local eldoc-documentation-function
              (lambda ()
                  (when (ensime-connected-p)
                    (let ((err (ensime-print-errors-at-point)))
                      (and err (not (string= err "")) err)))))
  (eldoc-mode +1))

(add-hook 'ensime-mode-hook 'scala/enable-eldoc)
