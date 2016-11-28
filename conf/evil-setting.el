;;; evil-setting.el --- evil's settings.
;;; Commentary:

;;; Code:
;; Evilの読み込み
(el-get-bundle evil)
(el-get-bundle evil-smartparens)
(el-get-bundle evil-leader)
(el-get-bundle evil-org-mode)

(require 'evil)

(with-eval-after-load 'evil
  (evil-mode 1)
  (el-get-bundle powerline-evil)
  (require 'powerline-evil)

  (setq key-chord-two-keys-delay 0.3)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

  (define-key evil-motion-state-map (kbd "SPC") nil)
  (define-key evil-motion-state-map (kbd "SPC f r") 'helm-recentf)

  (require 'evil-leader)
  (require 'evil-org))

(provide 'evil-setting)
;;; evil-setting.el ends here

