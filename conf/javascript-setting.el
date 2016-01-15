;;; javascruot-setting.el --- javascript-mode's settings.
;;; Commentary:

;;; Code:
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-hook 'js2-mode-hook #'js2-refactor-mode)

(autoload 'coffee-mode "coffee-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.coffee" . coffee-mode))

(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq ac-js2-evaluate-calls t)

(require 'jquery-doc)
(add-hook 'js2-mode-hook 'jquery-doc-setup)

(require 'skewer-mode)
(add-hook 'js2-mode-hook 'skewer-mode)

(add-to-list 'company-backends '(ac-js2-company company-jquery))
(provide 'javascript-setting)
;;; javascript-setting ends here
