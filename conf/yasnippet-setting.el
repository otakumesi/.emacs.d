;;; yasnippet-setting.el --- yasinippet's settings.
;;; Commentary:

;;; Code:
;(require 'yasnippet-bundle)
(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/yasnippet-snippets"))
(yas-global-mode t)

(define-key yas-minor-mode-map (kbd "C-x y i") 'yas-insert-snippet)
(define-key yas-minor-mode-map (kbd "C-x y v") 'yas-visit-snippet-file)

(require 'common-lisp-snippets)

(provide 'yasnippet-setting)
;;; yasnippet-setting.el ends here
