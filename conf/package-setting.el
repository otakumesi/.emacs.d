;;; package --- Summary
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
    auto-complete fuzzy

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
    enh-ruby-mode ruby-electric ruby-block

    ;;;; javascript
    js2-mode coffee-mode

    ;;;; gtags
    gtags

    ;;;; flycheck
    flycheck helm-flycheck

    ;;;; helm
    helm helm-core helm-projectile helm-gtags

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
    yasnippet

    ;;;; twitter
    twittering-mode

    ;;; etc-mode
    gitignore-mode markdown-mode

    ;;;; etc
    with-editor
    ))

(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-install package)))

;; パッケージの設定・インストール等
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-init-file "~/.emacs.d/init.el")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

(provide 'package-setting)
;;; package-setting.el ends here
