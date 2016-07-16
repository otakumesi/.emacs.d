;;; package-setting.el --- package.el's setting file
;;; Commentary:

;;; Code:
(require 'package)
(add-to-list 'package-archives
                    '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; インストールするパッケージ
(defvar my-packages
  '(
    ;; auto-complete
    ;;auto-complete
    fuzzy
    readline-complete
    ac-js2
    ac-html-csswatcher
    ac-html-bootstrap

    ;; company-mode
    company
    jquery-doc
    company-web
    company-edbi
    company-restclient
    helm-company
    company-quickhelp
    company-web
    company-statistics
    ;; slime-company
    company-go

    ;;;; tree
    neotree
    undo-tree

    ;; smartparens
    smartparens
    evil-smartparens

    ;; magit/git
    magit
    gitignore-mode

    ;; keychord
    key-chord

    ;; anzu
    anzu

    ;; plant-uml
    puml-mode

    ;; undo-tree
    undo-tree

    ;; common lisp
    ;; slime
    ;; flylisp

    ;;;; ruby
    enh-ruby-mode
    ruby-electric
    ruby-block
    slim-mode
    robe
    rubocop
    inf-ruby
    ruby-tools
    ruby-refactor
    ruby-hash-syntax
    ruby-additional
    company-inf-ruby
    rbenv

    ;;; rails
    evil-rails
    helm-rails
    projectile-rails
    rspec-mode
    bundler

    ;; go
    go-mode
    go-projectile
    go-snippets
    golint
    helm-go-package
    go-eldoc
    go-dlv

    ;;; haskell
    ;; haskell-mode ghc hindent company-ghc shm

    ;;;; javascript
    js2-mode
    coffee-mode
    jquery-doc
    js2-refactor
    ;; coffee-mode
    stylus-mode
    jade-mode
    jsfmt
    tern
    company-tern
    react-snippets

    ;; typescript
    typescript-mode
    tide

    ;;; json
    json-mode
    json-reformat

    ;;;; gtags
    gtags
    helm-gtags

    ;;;; flycheck
    flycheck
    helm-flycheck
    flycheck-color-mode-line
    flycheck-package
    flycheck-pos-tip
    ;; flycheck-haskell

    ;;;; helm
    helm
    helm-core
    helm-projectile
    helm-css-scss
    helm-rubygems-org

    ;;;; projectile
    projectile

    ;;;; evil
    evil
    evil-magit
    powerline-evil
    evil-org
    evil-leader

    ;;;; solarized
    solarized-theme

    ;;;; powerline/theme/UI
    powerline
    abyss-theme
    popup

    ;;;; elisp-library
    dash
    epl
    seq

    ;;;; async
    async

    ;;;; goto-change
    goto-chg
    goto-last-change

    ;;; packages
    pkg-info
    auto-async-byte-compile

    ;;;; yasnippet
    yasnippet
    helm-c-yasnippet
    ;; common-lisp-snippets
    react-snippets

    ;;;; twitter
    ;; twittering-mode

    ;;; web-mode
    web-mode
    scss-mode
    yaml-mode

    ;;; etc-mode
    gitignore-mode
    markdown-mode
    restclient
    motion-mode
    emmet-mode

    ;;; shell
    exec-path-from-shell

    ;;; todo
    org

    ;;; japanese
    ddskk
    migemo

    ;;; window, screen
    popwin
    popup
    elscreen
    buffer-move
    fullscreen-mode
    desktop+

    ;;;; etc
    with-editor
    know-your-http-well
    restart-emacs
    hlinum
    elisp-slime-nav
    font-lock+
    rainbow-delimiters
    volatile-highlights
    w3
    quickrun
    esup
    eldoc-eval
    eldoc-extension
    ))

(dolist (package my-packages)
  (unless (package-installed-p package)
    (funcall
     (lambda ()
      ;; パッケージリストの読み込み
        (add-to-list 'package-archives
                    '("marmalade" . "http://marmalade-repo.org/packages/") t)
        (add-to-list 'package-archives
                    '("melpa" . "http://melpa.milkbox.net/packages/") t)
        (add-to-list 'package-archives
                    '("org" . "http://orgmode.org/elpa/") t)
        (package-initialize)
        (package-install package)))
    ))


;; パッケージの設定・インストール等
(autoload 'auto-async-byte-compile "auto-async-byte-compile")
(with-eval-after-load 'auto-async-byte-compile
  (setq auto-async-byte-compile-init-file "~/.emacs.d/init.el")
  (setq auto-async-byte-compile-exclude-files-regexp "~/.emacs.d/init.el")
  (setq auto-async-byte-compile-exclude-files-regexp "~/.emacs.d/conf/package-setting.el")
  (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode))
(add-hook 'kill-emacs-hook 'auto-async-byte-compile)

(provide 'package-setting)
;;; package-setting.el ends here
