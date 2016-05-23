;;; yasnippet-setting.el --- yasinippet's settings.
;;; Commentary:

;;; Code:
;(require 'yasnippet-bundle)
(autoload 'yasnippet "yassnippet")
(with-eval-after-load 'yasnippet
  (require 'helm-c-yasnippet)
  (setq helm-yas-space-match-any-greedy t)
  (define-key yas-minor-mode-map (kbd "C-c y") 'helm-yas-complete)
  (require 'react-snippets)
;;  (setq yas-snippet-dirs '("~/.emacs.d/yasnippet-snippets"))
  (yas-load-directory "~/.emacs.d/yasnippet-snippets")
  (yas-global-mode t)
  (define-key yas-minor-mode-map (kbd "C-x y i") 'yas-insert-snippet)
  (define-key yas-minor-mode-map (kbd "C-x y v") 'yas-visit-snippet-file))

(provide 'yasnippet-setting)
;;; yasnippet-setting.el ends here
