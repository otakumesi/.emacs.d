;;; company-mode-setting.el --- company-mode's settings.
;;; Commentary:

;;; Code:
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
(setq company-begin-commands '(self-insert-command))
(setq company-minimum-prefix-length 4)
(setq company-selection-wrap-around t)

;;; company-statistics
(add-hook 'after-init-hook 'company-statistics-mode)

(company-quickhelp-mode +1)

(require 'helm-company)
(eval-after-load 'company
  '(progn
     (define-key company-mode-map [?\C-:] 'helm-company)
     (define-key company-active-map [?\C-:] 'helm-company)
     ))

(push 'company-robe company-backends)

(provide 'company-mode-setting)
;;; company-mode-setting ends here
