;; ロードパス
(setq load-path(append load-path'("~/.emacs.d/elisp")))

;; 鬼軍曹の設置
;; (require 'drill-instructor)
;; (setq drill-instructor-global t)

(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; カラーテーマ
(when (require 'color-theme)
  (color-theme-initialize)
  (when (require 'color-theme-solarized)
    (color-theme-solarized-dark)))

(require 'evil)
(evil-mode 1)
