;;; ruby-setting.el --- ruby-mode's setting.
;;; Commentary:

;;; Code:

;; (autoload 'enh-ruby-mode "enh-ruby-mode"
;;   "Major mode for ruby files" t)

;; enh-ruby-modeでRubyモードを導入する
(require 'enh-ruby-mode)
(setq enh-ruby-program "~/.rbenv/shims/ruby")

(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.watchr$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.slim$" . slim-mode))

;; rbenv
(require 'rbenv)
(add-hook 'enh-ruby-mode-hook 'global-rbenv-mode)
(with-eval-after-load 'global-rbenv-mode
    (rbenv-use-global)
    (setq rbenv-installation-dir "/usr/local/var/rbenv")
    (setq rbenv-modeline-function 'rbenv--modeline-plain))

;; inf-ruby
(require 'inf-ruby)
(add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
(setq inf-ruby-default-implementation "pry")
(setq inf-ruby-eval-binding "Pry.toplevel_binding")

;; Robeの起動
(require 'robe)
(add-hook 'enh-ruby-mode-hook 'robe-mode)

(add-hook 'enh-ruby-mode-hook (lambda ()
                                     (robe-rails-refresh)
                                     (add-to-list 'company-backends '(company-robe company-files company-yasnippet company-restclient))))

(with-eval-after-load 'ruby-mode
  (setq ruby-program "~/.rbenv/shims/ruby")
  (custom-set-variables '(ruby-insert-encoding-magic-comment nil)))

(with-eval-after-load 'enh-ruby-mode

  ;; マジックコメントの削除
  (defun remove-enh-magic-comment ()
    (remove-hook 'before-save-hook 'enh-ruby-mode-set-encoding t))
  (add-hook 'enh-ruby-mode-hook 'remove-enh-magic-comment)
  (setq enh-ruby-use-encoding-map nil)

  ;; rails
  (require 'helm-rails)

  ;; Rubyのブロックハイライト
  ;; (require 'ruby-block)
  ;; (add-hook 'enh-ruby-mode-hook 'ruby-block-mode)

  ;; ruby-etc
  (require 'ruby-refactor)
  (eval-after-load 'ruby-refactor (ruby-refactor-mode-launch))
  (require 'ruby-tools)
  (add-hook 'enh-ruby-mode-hook 'ruby-tools-mode)
  (eval-after-load 'ruby-tools-mode 'ruby-tools-mode)
  ;; 括弧のシンタックスハイライト
  (require 'ruby-electric)
  (eval-after-load 'ruby-electric-mode '(ruby-electric-mode t))

  ;; rubocop
  (require 'rubocop)

  (flycheck-define-checker ruby-rubocop
    "A Ruby syantax and style checker using the RuboCop tool."
    :command ("rubocop" "--format" "emacs"
              (config-file "--config" flycheck-rubocoprc)
              source)
    :standard-input t
    :error-patterns
    ((warning line-start
              (file-name) ":" line ":" (or "C" "W") ":" (message)
              line-end)
     (error line-start
            (file-name) ":" line ":" (or "C" "W") ":" (message)
            line-end))
    :modes (enh-ruby-mode motion-mode))

  (flycheck-define-checker ruby-rubylint
    "A Ruby syantax and style checker using the rubyline tool."
    :command ("ruby-lint" source)
    :error-patterns
    ((warning line-start
              (file-name) ":" line ":" column ":" (or "C" "W") ":" (message)
              line-end)
     (error line-start
            (file-name) ":" line ":" column ":" (or "C" "W") ":" (message)
            line-end))
  :modes (enh-ruby-mode ruby-mode)))

;; projectile-rails
(add-hook 'enh-ruby-mode-hook 'projectile-rails-on)

(autoload 'rspec-mode "rspec-mode" "" t)
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

(provide 'ruby-setting)
;;; ruby-setting.el ends here
