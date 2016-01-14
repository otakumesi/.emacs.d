;;; helm-setting.el --- helm's settings.
;;; Commentary:

;;; Code:
(require 'helm)
(require 'helm-config)
(helm-mode 1)
(define-key global-map (kbd "M-x") 'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)

(require 'projectile)
(require 'helm-projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(require 'helm-css-scss)

;; helm-gtagsの設定
(require 'helm-gtags)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'ruby-mode-hook 'helm-gtags-mode)
(add-hook 'emacs-lisp-mode 'helm-gtags-mode)
(add-hook 'javascript-mode 'helm-gtags-mode)

(add-hook 'helm-gtags-mode-hook
          '(lambda()
             ;; 入力されたタグの'定義元'へジャンプ
             (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
             ;; 入力タグを'参照'する場所へジャンプ
             (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
             ;; 入力されたシンボルを参照する場所にジャンプ
             (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
             ;; ジャンプ前に戻る
             (local-set-key (kbd "C-t") 'helm-gtsgs-pop-stack)))

(provide 'helm-setting)
;;; helm-setting.el ends here
