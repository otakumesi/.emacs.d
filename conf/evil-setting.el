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

  ;;(require 'smartparens-config)
  ;;(smartparens-global-mode t)
  ;;(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)

  (require 'evil-leader)
  (require 'evil-org))

(provide 'evil-setting)
;;; evil-setting.el ends here

