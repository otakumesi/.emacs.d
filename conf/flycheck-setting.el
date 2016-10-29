;;; flycheck-setting.el --- flycheck's settings.
;;; Commentary:

;;; Code:

;; flycheck
(el-get-bundle flycheck)
(el-get-bundle package-lint)
(el-get-bundle flycheck-package)

(el-get-bundle flycheck-color-mode-line)
(el-get-bundle flycheck-pos-tip)

(require 'flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)

(with-eval-after-load 'flycheck
  (require 'flycheck-color-mode-line)
  (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
  (setq-default flycheck-disable-checkers '(javascript-jshint))
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (flycheck-package-setup)
  (flycheck-pos-tip-mode))

(provide 'flycheck-setting)
;;; flycheck-setting.el ends here
