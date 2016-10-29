;;; helm-setting.el --- helm's settings.
;;; Commentary:

;;; Code:
(el-get-bundle helm)
(require 'helm)
(helm-mode 1)
(define-key global-map (kbd "M-x") 'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)

(el-get-bundle helm-css-scss)
(require 'helm-css-scss)

;; helm-gtagsの設定
(el-get-bundle helm-gtags)
(require 'helm-gtags)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'enh-ruby-mode-hook 'helm-gtags-mode)
(add-hook 'emacs-lisp-mode-hook 'helm-gtags-mode)
(add-hook 'javascript-mode-hook 'helm-gtags-mode)
(setq helm-gtags-path-style 'root)
(setq helm-gtags-auto-update t)
(add-hook 'helm-gtags-mode-hook
          (lambda ()
             (local-set-key (kbd "C-c g t") 'helm-gtags-find-tag)
             (local-set-key (kbd "C-c g r") 'helm-gtags-find-rtag)
             (local-set-key (kbd "C-c g s") 'helm-gtags-select)
             (local-set-key (kbd "C-c g p") 'helm-gtags-pop-stack)
             (local-set-key (kbd "C-c g c") 'helm-gtags-clear-stack)))

(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

(provide 'helm-setting)
;;; helm-setting.el ends here
