;; ロードパス
(setq load-path(append load-path'("~/.emacs.d/conf")))
(load "user-setting")

;; 鬼軍曹の設置
;; (require 'drill-instructor)
;; (setq drill-instructor-global t)

;; パッケージリストの読み込み
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(package-refresh-contents)
(load "package-setting")

;; カラーテーマ
(when (require 'color-theme)
  (color-theme-initialize)
  (when (require 'color-theme-solarized)
    (color-theme-solarized-dark)))

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

;; Magitの読み込み
(require 'magit)
(require 'evil-magit)

;; TreeのElisp
(require 'neotree)
(global-set-key "\C-x4" 'neotree-toggle)
