;;; package -- Summary:

;;; Commentary:

;;; Code:
(require 'go-mode-autoloads)

(with-eval-after-load "go-mode"
  (require 'golint))

(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)

(require 'company-go)
;;(add-to-list 'company-backends '(company-go company-file company-yasnippet))
(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go company-files company-yasnippet))
                          (company-mode)
                          (setq tab-width 2)))

(autoload 'helm-go-package "helm-go-package")
(eval-after-load 'go-mode
  '(substitute-key-definition 'go-import-add 'helm-go-package go-mode-map))

(provide 'golang-setting)
;;; golang-setting.el ends here
