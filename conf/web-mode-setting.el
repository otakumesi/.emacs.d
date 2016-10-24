;;; web-mode-setting.el --- web-mode's settings.
;;; Commentary:

;;; Code:
(autoload 'web-mode "web-mode")
(autoload 'scss-mode "scss-mode")
(autoload 'slim-mode "slim-mode")

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

(require 'company-web)
(require 'company-web-html)
(require 'company-web-slim)

(defun eval-company-after-load (mode-symbol)
  (with-eval-after-load mode-symbol
    ;; company-web
    (add-to-list 'company-backends '(company-web-html company-css company-web-bootstrap+ company-web-fa+))))

(with-eval-after-load 'company-web
  '(add-to-list 'company-backends '(company-css company-web-fa+ company-web-bootstrap+)))

(with-eval-after-load 'company-web-html
  '(add-to-list 'company-backends '(company-web-html)))

(with-eval-after-load 'company-web-slim
  '(add-to-list 'company-backends '(company-web-slim)))

(add-hook 'slim-mode-hook (lambda ()
                            (add-to-list 'company-backends '(comapny-web-slim company-css company-robe company-web-bootstrap+ company-web-fa+))))

;; skewer
(add-hook 'web-mode-hook 'skewer-html-mode)
(add-hook 'scss-mode-hook 'skewer-css-mode)
(eval-after-load 'scss-mode '(setq css-indent-offset 2))

(provide 'web-mode-setting)
;;; web-mode-setting.el ends here
