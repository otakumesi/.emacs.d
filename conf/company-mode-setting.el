;;; company-mode-setting.el --- company-mode's settings.
;;; Commentary:

;;; Code:
(global-company-mode)
(setq company-idle-delay 0)
(setq company-selection-wrap-around t)

(eval-after-load 'company
  '(push 'company-robe company-backends))
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq ac-js2-evaluate-calls t)
(require 'jquery-doc)
(add-hook 'js2-mode-hook 'jquery-doc-setup)

(company-quickhelp-mode +1)

(require 'helm-company)
(eval-after-load 'company
  '(progn
     (define-key company-mode-map [?\C-:] 'helm-company)
     (define-key company-active-map [?\C-:] 'helm-company)
     ))

(provide 'company-mode-setting)
;;; company-mode-setting ends here
