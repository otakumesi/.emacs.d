;;; ruby-setting.el --- ruby-mode's setting.
;;; Commentary:

;;; Code:
;; enh-ruby-modeでRubyモードを導入する
(autoload 'enh-ruby-mode "enh-ruby-mode"
  "Major mode for ruby files" t)

(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.slim$" . slim-mode))

(with-eval-after-load 'ruby-mode-hook
  (setq ruby-program "~/.rbenv/shims/ruby")
  (custom-set-variables '(ruby-insert-encoding-magic-comment nil)))

(autoload 'rspec-mode "rspec-mode" "" t)
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

;; rails
(eval-after-load 'enh-ruby-mode '(require 'helm-rails))

;; ruby-etc
(eval-after-load 'enh-ruby-mode '(require 'rubocop))
(eval-after-load 'enh-ruby-mode '(require 'ruby-hash-syntax))

;; projectile-rails
(add-hook 'ruby-mode-hook 'projectile-rails-on)

;; rbenv
(eval-after-load 'enh-ruby-mode '(require 'rbenv))
(with-eval-after-load 'rbenv
  (global-rbenv-mode)
  (rbenv-use-global)
  (setq rbenv-modeline-function 'rbenv--modeline-plain))

;; Rubyのブロックハイライト
(eval-after-load 'enh-ruby-mode '(require 'ruby-block))
(eval-after-load 'ruby-block '(ruby-block-mode t))

;; 括弧のシンタックスハイライト
(eval-after-load 'enh-ruby-mode '(require 'ruby-electric))
(eval-after-load 'ruby-electric-mode '(ruby-electric-mode t))

;; Robeの起動
(eval-after-load 'enh-ruby-mode '(require 'robe))
(with-eval-after-load 'robe-mode
  (robe-mode)
  (push 'company-robe company-backends))

(eval-after-load 'enh-ruby-mode '(require 'ruby-refactor))
(eval-after-load 'ruby-refactor (ruby-refactor-mode-launch))

(eval-after-load 'enh-ruby-mode '(require 'ruby-tools))
(eval-after-load 'ruby-tools 'ruby-tools-mode)

(with-eval-after-load 'enh-ruby-mode
  (setq enh-ruby-program "~/.rbenv/shims/ruby")
  (lambda ()
    ;; マジックコメントの削除
    (defun remove-enh-magic-comment ()
      (remove-hook 'before-save-hook 'enh-ruby-mode-set-encoding t))
    (add-hook 'enh-ruby-mode-hook 'remove-enh-magic-comment)
    (setq enh-ruby-use-encoding-map nil))

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

(provide 'ruby-setting)
;;; ruby-setting.el ends here
