(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;;(el-get 'sync)

;; use-package
(el-get-bundle use-package)
;; auto-complete
(el-get-bundle fuzzy)
(el-get-bundle readline-complete)
(el-get-bundle ac-js2)
(el-get-bundle melpa:ac-html-csswatcher)
(el-get-bundle melpa:ac-html-bootstrap)
;; company-mode
(el-get-bundle melpa:company)
(el-get-bundle jquery-doc)
(el-get-bundle company-web)
(el-get-bundle company-edbi)
(el-get-bundle company-restclient)
(el-get-bundle helm-company)
(el-get-bundle company-quickhelp)
(el-get-bundle company-web)
(el-get-bundle company-statistics)
;; slime-company
(el-get-bundle melpa:company-go)
;;;; tree
(el-get-bundle neotree)
(el-get-bundle undo-tree)
;; smartparens
(el-get-bundle smartparens)
(el-get-bundle evil-smartparens)
 ;; magit/git
(el-get-bundle magit)
(el-get-bundle gitignore-mode)
 ;; keychord
(el-get-bundle key-chord)
;; anzu
(el-get-bundle anzu)
;; plant-uml
(el-get-bundle puml-mode)
;; undo-tree
(el-get-bundle undo-tree)
;; common lisp
;; slime
;; flylisp

;;;; ruby
(el-get-bundle enh-ruby-mode)
(el-get-bundle ruby-electric)
(el-get-bundle ruby-block)
(el-get-bundle slim-mode)
(el-get-bundle melpa:robe)
(el-get-bundle rubocop)
(el-get-bundle inf-ruby)
(el-get-bundle ruby-tools)
(el-get-bundle ruby-refactor)
(el-get-bundle ruby-hash-syntax)
(el-get-bundle melpa:ruby-additional)
(el-get-bundle company-inf-ruby)
(el-get-bundle rbenv)
;;; rails
(el-get-bundle evil-rails)
(el-get-bundle helm-rails)
(el-get-bundle projectile-rails)
(el-get-bundle rspec-mode)
(el-get-bundle bundler)
;; go
(el-get-bundle go-mode)
(el-get-bundle go-projectile)
(el-get-bundle melpa:go-snippets)
(el-get-bundle melpa:golint)
(el-get-bundle helm-go-package)
(el-get-bundle go-eldoc)
(el-get-bundle melpa:go-dlv)
;;; haskell
;; haskell-mode ghc hindent company-ghc shm

;;;; javascript
(el-get-bundle js2-mode)
(el-get-bundle coffee-mode)
(el-get-bundle jquery-doc)
(el-get-bundle js2-refactor)
;; coffee-mode
(el-get-bundle melpa:stylus-mode)
(el-get-bundle jade-mode)
(el-get-bundle jsfmt)
(el-get-bundle tern)
(el-get-bundle company-tern)
(el-get-bundle melpa:react-snippets)
;; typescript
(el-get-bundle typescript-mode)
(el-get-bundle tide)
;;; json
(el-get-bundle json-mode)
(el-get-bundle json-reformat)
;;;; gtags
(el-get-bundle gtags)
(el-get-bundle helm-gtags)
;;;; flycheck
(el-get-bundle flycheck)
(el-get-bundle melpa:helm-flycheck)
(el-get-bundle flycheck-color-mode-line)
(el-get-bundle flycheck-package)
(el-get-bundle flycheck-pos-tip)
;; flycheck-haskell
;;;; helm
(el-get-bundle helm)
(el-get-bundle melpa:helm-core)
(el-get-bundle helm-projectile)
(el-get-bundle helm-css-scss)
(el-get-bundle melpa:helm-rubygems-org)
;;;; projectile
(el-get-bundle projectile)
;;;; evil
(el-get-bundle evil)
(el-get-bundle evil-magit)
(el-get-bundle powerline-evil)
(el-get-bundle evil-org)
(el-get-bundle evil-leader)
;;;; solarized
(el-get-bundle melpa:solarized-theme)
;;;; powerline/theme/UI
(el-get-bundle powerline)
(el-get-bundle popup)
;;;; elisp-library
(el-get-bundle dash)
(el-get-bundle epl)
(el-get-bundle seq)
;;;; async
(el-get-bundle melpa:async)
;;;; goto-change
(el-get-bundle goto-chg)
(el-get-bundle goto-last-change)
;;; packages
(el-get-bundle pkg-info)
(el-get-bundle auto-async-byte-compile)
;;;; yasnippet
(el-get-bundle yasnippet)
(el-get-bundle helm-c-yasnippet)
;; common-lisp-snippets
(el-get-bundle react-snippets)
;;; web-mode
(el-get-bundle web-mode)
(el-get-bundle scss-mode)
(el-get-bundle yaml-mode)
;;; etc-mode
(el-get-bundle gitignore-mode)
(el-get-bundle markdown-mode)
(el-get-bundle restclient)
(el-get-bundle motion-mode)
(el-get-bundle emmet-mode)
;;; shell
(el-get-bundle exec-path-from-shell)
;;; todo
(el-get-bundle melpa:org)
;;; window, screen
(el-get-bundle popwin)
(el-get-bundle popup)
(el-get-bundle elscreen)
(el-get-bundle buffer-move)
(el-get-bundle fullscreen-mode)
;;(el-get-bundle desktop+)
;;;; etc
(el-get-bundle with-editor)
(el-get-bundle know-your-http-well)
(el-get-bundle restart-emacs)
(el-get-bundle hlinum)
(el-get-bundle elisp-slime-nav)
(el-get-bundle font-lock+)
(el-get-bundle rainbow-delimiters)
(el-get-bundle volatile-highlights)
(el-get-bundle melpa:w3)
(el-get-bundle quickrun)
(el-get-bundle esup)
(el-get-bundle eldoc-eval)
(el-get-bundle eldoc-extension)