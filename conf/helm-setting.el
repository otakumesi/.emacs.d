;;; helm-setting.el --- helm's settings.
;;; Commentary:

;;; Code:
(require 'helm)
(require 'helm-config)
(helm-mode 1)
(define-key global-map (kbd "M-x") 'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)

(require 'helm-css-scss)

;; helm-gtagsの設定
(require 'helm-gtags)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'enh-ruby-mode-hook 'helm-gtags-mode)
(add-hook 'emacs-lisp-mode-hook 'helm-gtags-mode)
(add-hook 'javascript-mode-hook 'helm-gtags-mode)
(setq helm-gtags-path-style 'root)
(setq helm-gtags-auto-update t)
(add-hook 'helm-gtags-mode-hook
          (lambda ()
             (local-set-key (kbd "M-t") 'helm-gtags-tag)
             (local-set-key (kbd "M-s") 'helm-gtags-find-rtag)
             (local-set-key (kbd "M-p") 'helm-gtags-select)))

(provide 'helm-setting)
;;; helm-setting.el ends here
