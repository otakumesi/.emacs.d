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
(add-to-list 'company-backends '(company-web-html company-css company-web-bootstrap+ company-web-fa+))
(add-to-list 'company-backends '(comapny-web-slim company-css company-web-bootstrap+ company-web-fa+))

;; skewer
(add-hook 'web-mode-hook 'skewer-html-mode)
(add-hook 'scss-mode-hook 'skewer-css-mode)

(add-hook 'scss-mode-hook (lambda ()
                             (setq css-indent-offset 2)))

(provide 'web-mode-setting)
;;; web-mode-setting.el ends here
