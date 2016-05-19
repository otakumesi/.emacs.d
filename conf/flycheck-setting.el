;;; flycheck-setting.el --- flycheck's settings.
;;; Commentary:

;;; Code:

;; flycheck
(require 'flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)

(with-eval-after-load 'flycheck
  (require 'flycheck-color-mode-line)
  (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
  (flycheck-package-setup)
  (flycheck-pos-tip-mode))

(provide 'flycheck-setting)
;;; flycheck-setting.el ends here
