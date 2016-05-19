;;; javascruot-setting.el --- javascript-mode's settings.
;;; Commentary:

;;; Code:
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-hook 'js2-mode-hook 'js2-refactor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-js))
(flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)

(add-to-list 'auto-mode-alist '("\\.jade\\'" . js2-mode))
(autoload 'jade-mode "jade-mode")
(autoload 'coffee-mode "coffee-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.coffee" . coffee-mode))

(autoload 'json-mode "json-mode")
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

(with-eval-after-load 'js2-mode
  (flycheck-add-next-checker 'javascript-jshint
                             'javascript-gjslint)
  (autoload 'jquery-doc-setup 'jquery-doc)
  (autoload 'skewer-mode 'skewer-mode))

(with-eval-after-load 'ac-js2-mode
  (setq ac-js2-evaluate-calls t)
  (add-to-list 'company-backends '(ac-js2-company company-jquery)))

(provide 'javascript-setting)
;;; javascript-setting ends here
