;;; company-mode-setting.el --- company-mode's settings.
;;; Commentary:

;;; Code:
(el-get-bundle company-mode)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; (el-get-bundle helm-company)
;; (autoload 'helm-company "helm-company")

(el-get-bundle company-statistics)
(with-eval-after-load 'company-mode
  ;; (define-key company-mode-map [?\C-:] 'helm-company)
  ;; (define-key company-active-map [?\C-:] 'helm-company)
  (setq company-idle-delay 0)
  ;; (setq company-begin-commands '(self-insert-command))
  (setq company-minimum-prefix-length 3)
  (setq company-selection-wrap-around t)
  (setq company-dabbrev-downcase nil))

  ;; company-statistics
  (add-hook 'after-init-hook 'company-statistics-mode)
  ;;(company-quickhelp-mode nil)
  ;;(custom-set-variables '(company-quickhelp-delay nil))

(provide 'company-mode-setting)
;;; company-mode-setting ends here
