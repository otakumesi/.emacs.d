;;; web-mode-setting.el --- web-mode's settings.
;;; Commentary:

;;; Code:
(require 'web-mode)
(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(require 'slim-mode)

;;; company-web
(require 'company-web)
(require 'company-web-html)
(require 'company-web-slim)
(add-hook 'web-mode-hook (lambda ()
                           (set (make-local-variable 'company-backends) '(company-web-html))
                           (company-mode t)))
(add-hook 'slim-mode-hook (lambda ()
                           (set (make-local-variable 'company-backends) '(company-web-slim))
                           (company-mode t)))

(provide 'web-mode-setting)
;;; web-mode-setting.el ends here
