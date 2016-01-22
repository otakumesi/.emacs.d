;;; init.el --- initialize file.
;;; Commentary:
;;; Code:

;;; ロードパス:
(setq load-path(append load-path'("~/.emacs.d/conf")))
(load "user-setting")

(setq default-frame-alist
      (append (list '(width . 182)
                    '(height . 48))
              default-frame-alist))

;; 鬼軍曹の設置
;; (require 'drill-instructor)
;; (setq drill-instructor-global t)

(load "package-setting")

;; カラーテーマ
(when (require 'color-theme)
  (color-theme-initialize)
  (when (require 'color-theme-solarized)
    (color-theme-solarized)
    (set-frame-parameter nil 'background-mode 'dark)))

;; key-chordの読み込み
(require 'key-chord)
(key-chord-mode 1)

;; パッケージの読み込み・ユーザー設定のロード
(load "helm-setting")
(load "elscreen-setting")
(load "evil-setting")
(load "powerline-setting")
(load "company-mode-setting")
(load "flycheck-setting")
(load "yasnippet-setting")
;(load "auto-complete-setting")
(load "ruby-setting")
(load "javascript-setting")
(load "elisp-setting")
(load "web-mode-setting")
;(load "tabbar-setting")

;; Magitの読み込み
(require 'magit)
(require 'evil-magit)
(global-set-key (kbd "M-m") prefix-arg)
(global-set-key (kbd "M-m m") 'magit-status)
(global-set-key (kbd "M-m i") 'magit-init)

(require 'neotree)
(global-set-key "\C-x4" 'neotree-toggle)

;; twitter
(require 'twittering-mode)
(setq twittering-use-master-password t)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; shell
;(load-file "~/.emacs.d/shellenv.el")
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
(let ((envs '("PATH")))
  (exec-path-from-shell-copy-envs envs))

;; rails
(require 'helm-rails)
(require 'rinari)

;; etc
(require 'restclient)

;;; skk
(when (require 'skk nil t)
  (global-set-key "\C-xj" 'skk-auto-fill-mode)
  (setq default-input-method "japanese-skk")
  (require 'skk-study))

;;; open init.el
(global-set-key (kbd "M-I") (lambda () (interactive)
                              (switch-to-buffer (find-file-noselect "~/.emacs.d/init.el"))))
(global-set-key (kbd "M-W") (lambda () (interactive)
                              (switch-to-buffer (find-file-noselect "~/workspace"))))

(put 'dired-find-alternate-file 'disabled nil)

;; font-rock
(require 'font-lock+)
(global-font-lock-mode 1)
(setq font-lock-support-mode 'jit-lock-mode)

;; Rubyのシンタックスハイライト
(add-hook 'enh-ruby-mode-hook
          '(lambda ()
             (font-lock-mode 1)))

(provide 'init)
;;; init.el ends here
