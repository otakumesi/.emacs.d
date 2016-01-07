;; インストールするパッケージ
(defvar my-packages
  '(
    ;;;; auto-complete
    auto-complete fuzzy

    ;;;; tree
    neotree undo-tree

    ;;;; magit/git
    magit magit-tree gitignore-mode

    ;;;; keychord
    key-chord

    ;;;; ruby
    enh-ruby-mode ruby-electric ruby-block

    ;;;; javascript
    js2-mode coffee-mode

    ;;;; gtags
    gtags

    ;;;; helm
    helm helm-core helm-projectile helm-gtags

    ;;;; projectile
    projectile

    ;;;; evil
    evil evil-magic

    ;;;; color-theme
    color-theme color-theme-solarized

    ;;;; powerline/theme/UI
    powerline abyss-theme popup

    ;;;; elisp-library
    dash epl

    ;;;; async
    async

    ;;;; goto-change
    goto-chg goto-last-change

    ;;;; etc
    pkg-ingo with-editor
    ))

;; my-packagesからインストールしていないパッケージをインストール
(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-install package)))
