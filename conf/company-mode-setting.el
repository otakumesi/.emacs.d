;;; company-mode-setting.el --- company-mode's settings.
;;; Commentary:

;;; Code:
(add-hook 'after-save-hook 'global-company-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq ac-js2-evaluate-calls t)
(require 'jquery-doc)
(add-hook 'js2-mode-hook 'jquery-doc-setup)

;(require 'helm-company)
;(eval-after-load 'company
;  '(progn
;     (define-key company-mode-map (kbd "C-:") 'helm-company)
;     (define-key company-active-map (kbd "\C-:") 'helm-company)
;     ))

(provide 'company-mode-setting)
;;; company-mode-setting ends here
