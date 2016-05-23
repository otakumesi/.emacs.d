;;; company-mode-setting.el --- company-mode's settings.
;;; Commentary:

;;; Code:
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(autoload 'helm-company "helm-company")

(with-eval-after-load 'company
  (setq company-idle-delay 0)
  (setq company-begin-commands '(self-insert-command))
  (setq company-minimum-prefix-length 4)
  (setq company-selection-wrap-around t)

  ;; company-statistics
  (add-hook 'after-init-hook 'company-statistics-mode)

  (add-to-list 'company-backends '(company-yasnippet))

  (company-quickhelp-mode +1)
  (define-key company-mode-map [?\C-:] 'helm-company)
  (define-key company-active-map [?\C-:] 'helm-company)
  (define-key company-mode-map [?\C-:] 'helm-company)
  (define-key company-active-map [?\C-:] 'helm-company))


(provide 'company-mode-setting)
;;; company-mode-setting ends here
