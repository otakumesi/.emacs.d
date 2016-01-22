;;; package-setting.el --- package.el's setting file
;;; Commentary:

;;; Code:
;; パッケージリストの読み込み
(require 'package)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(package-refresh-contents)

;; インストールするパッケージ
(defvar my-packages
  '(
    ;;;; auto-complete
    ;auto-complete fuzzy
    readline-complete ac-js2 ac-html-csswatcher ac-html-bootstrap

    ;;;; company-mode
    company jquery-doc company-web company-edbi
    company-restclient helm-company company-quickhelp
    company-web company-statistics

    ;;;; tree
    neotree undo-tree

    ;;;; smartparens
    smartparens evil-smartparens

    ;;;; magit/git
    magit gitignore-mode

    ;;;; keychord
    key-chord

    ;;;; undo-tree
    undo-tree

    ;;;; ruby
    enh-ruby-mode ruby-electric ruby-block slim-mode robe

    ;;; rails
    rinari evil-rails helm-rails

    ;;;; javascript
    js2-mode coffee-mode jquery-doc js2-refactor

    ;;;; gtags
    gtags helm-gtags

    ;;;; flycheck
    flycheck helm-flycheck

    ;;;; helm
    helm helm-core helm-projectile helm-css-scss

    ;;;; projectile
    projectile

    ;;;; evil
    evil evil-magit powerline-evil

    ;;;; powerline
    powerline

    ;;;; color-theme
    color-theme color-theme-solarized

    ;;;; powerline/theme/UI
    powerline abyss-theme popup

    ;;;; elisp-library
    dash epl seq

    ;;;; async
    async

    ;;;; goto-change
    goto-chg goto-last-change

    ;;; packages
    pkg-info auto-async-byte-compile

    ;;;; yasnippet
    yasnippet helm-c-yasnippet

    ;;;; twitter
    twittering-mode

    ;;; web-mode
    web-mode scss-mode yaml-mode

    ;;; etc-mode
    gitignore-mode markdown-mode restclient

    ;;; shell
    exec-path-from-shell

    ;;; todo
    org

    ;;; japanese
    ddskk migemo

    ;;;; etc
    with-editor popup know-your-http-well elscreen restart-emacs font-lock+
    ))

(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-install package)))

;; パッケージの設定・インストール等
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-init-file "~/.emacs.d/init.el")
(setq auto-async-byte-compile-exclude-files-regexp "~/.emacs.d/init.el")
(setq auto-async-byte-compile-exclude-files-regexp "~/.emacs.d/conf/package-setting.el")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

(provide 'package-setting)
;;; package-setting.el ends here
