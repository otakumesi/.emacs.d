;;; company-mode-setting.el --- company-mode's settings.
;;; Commentary:

;;; Code:
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
(setq company-begin-commands '(self-insert-command))
(setq company-selection-wrap-around t)

(company-quickhelp-mode +1)

(require 'helm-company)
(eval-after-load 'company
  '(progn
     (define-key company-mode-map [?\C-:] 'helm-company)
     (define-key company-active-map [?\C-:] 'helm-company)
     ))

(provide 'company-mode-setting)
;;; company-mode-setting ends here
