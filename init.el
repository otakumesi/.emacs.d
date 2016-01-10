;; package --- Summary
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

;; powerline
(require 'powerline)
(powerline-center-evil-theme)

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
(load "evil-setting")
(load "powerline-setting")
(load "auto-complete-setting")
(load "helm-setting")
(load "ruby-setting")
(load "javascript-setting")
(load "elisp-setting")
(load "flycheck-setting")
(load "yasnippet-setting")

;; Magitの読み込み
(require 'magit)
(require 'evil-magit)

;; TreeのElisp
;(require 'neotree)
;(global-set-key "\C-x4" 'neotree-toggle)

;; twitter
(require 'twittering-mode)
(setq twittering-use-master-password t)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; shell
;(load-file "~/.emacs.d/shellenv.el")
(exec-path-from-shell-initialize)

;; rails
(require 'helm-rails)
(require 'evil-rails:)
(require 'rinari)

(when (require 'skk nil t)
  (global-set-key "\C-xj" 'skk-auto-fill-mode)
  (setq default-input-method "japanese-skk")
  (require 'skk-study))

(provide 'init)
;;; init.el ends here
