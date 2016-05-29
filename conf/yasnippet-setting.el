;;; yasnippet-setting.el --- yasinippet's settings.
;;; Commentary:

;;; Code:
;(require 'yasnippet-bundle)
(require 'yasnippet)
(setq yas-snippet-dirs '("~/.emacs.d/yasnippet-snippets"))
(require 'react-snippets)
(add-to-list 'load-path "~/.emacs.d/es6-snippets")
(require 'es6-snippets)
(yas-global-mode 1)

(with-eval-after-load 'yasnippet
  (require 'helm-c-yasnippet)
  (setq helm-yas-space-match-any-greedy t)
  (define-key yas-minor-mode-map (kbd "C-c y") 'helm-yas-complete)
  (define-key yas-minor-mode-map (kbd "C-c i") 'yas-insert-snippet)
  (define-key yas-minor-mode-map (kbd "C-c o") 'yas-visit-snippet-file))

(provide 'yasnippet-setting)
;;; yasnippet-setting.el ends here
