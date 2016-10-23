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
(add-to-list 'auto-mode-alist '("\\.jbuilder$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.watchr$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.slim$" . slim-mode))

;; yard-mode
(require 'yard-mode)
(add-hook 'enh-ruby-mode-hook 'yard-mode)

;; rbenv
(require 'rbenv)

;; bundler
(require 'bundler)

;; inf-ruby
(require 'inf-ruby)
(add-hook 'enh-ruby-mode-hook 'inf-ruby-minor-mode)
;; (add-to-list inf-ruby-implementations ("pry" . "pry"))
(setq inf-ruby-default-implementation "pry")
; (inf-ruby-console-gem (directory-file-name "/Users/niitsumatakurou/.rbenv/versions/2.3.0/lib/ruby/gems/2.3.0"))
(setq inf-ruby-eval-binding "Pry.toplevel_binding")

;; Robeの起動
(require 'robe)
(add-hook 'enh-ruby-mode-hook 'robe-mode)
(add-hook 'slim-mode-hook 'robe-mode)

(with-eval-after-load 'ruby-mode
  (custom-set-variables '(ruby-program "~/.rbenv/shims/ruby"))
  (custom-set-variables '(ruby-insert-encoding-magic-comment nil)))

(defun common-ruby-settings ()
  "Provide common ruby settings"
  (progn
    (global-rbenv-mode)
    (rbenv-use-global)
    (robe-start)
    (robe-eldoc)
    (setq rbenv-installation-dir "/usr/local/var/homebrew/linked/rbenv")
    (setq rbenv-modeline-function 'rbenv--modeline-plain)
    (add-to-list 'company-backends '(company-robe company-files company-restclient))))

(add-hook 'enh-ruby-mode-hook 'common-ruby-settings)
(add-hook 'slim-mode-hook 'common-ruby-settings)

;; projectile-rails
(add-hook 'enh-ruby-mode-hook 'projectile-rails-on)
(add-hook 'slim-mode-hook 'projectile-rails-on)
(add-hook 'scss-mode-hook 'projectile-rails-on)
(add-hook 'coffee-mode-hook 'projectile-rails-on)
(add-hook 'web-mode-hook 'projectile-rails-on)

(remove-hook 'enh-ruby-mode-hook 'ruby-end-mode)

(setq enh-ruby-deep-indent-paren nil)

(define-key robe-mode-map (kbd "C-c r d") 'robe-jump)
(define-key robe-mode-map (kbd "C-c r w") 'robe-ask)
(define-key robe-mode-map (kbd "C-c r q") 'robe-doc)

(defun erm-define-faces ()
  (defface enh-ruby-string-delimiter-face
    `((t :foreground ,(erm-darken-color font-lock-string-face)))
    "Face used to highlight string delimiters like \" and %Q."
    :group 'enh-ruby)

  (defface enh-ruby-heredoc-delimiter-face
    `((t :foreground ,(erm-darken-color font-lock-string-face)))
    "Face used to highlight string heredoc anchor strings like <<END and END"
    :group 'enh-ruby)

  (defface enh-ruby-regexp-delimiter-face
    `((t :foreground ,(erm-darken-color font-lock-string-face)))
    "Face used to highlight regexp delimiters like / and %r."
    :group 'enh-ruby)

  (defface enh-ruby-op-face
    `((t :foreground ,(erm-darken-color font-lock-keyword-face)))
    "Face used to highlight operators like + and ||"
    :group 'enh-ruby)

  (defface erm-syn-errline
    '((t (:box (:line-width 1 :color "red"))))
    "Face used for marking error lines."
    :group 'enh-ruby)

  (defface erm-syn-warnline
    '((t (:box (:line-width 1 :color "orange"))))
    "Face used for marking warning lines."
    :group 'enh-ruby))

(with-eval-after-load 'enh-ruby-mode
  (add-hook 'enh-ruby-mode-hook 'erm-define-faces)

  ;; マジックコメントの削除
  (defun remove-enh-magic-comment ()
    (remove-hook 'before-save-hook 'enh-ruby-mode-set-encoding t))
  (add-hook 'enh-ruby-mode-hook 'remove-enh-magic-comment)
  (setq enh-ruby-use-encoding-map nil)

  ;; rails
  ;; (require 'helm-rails)

  ;; Rubyのブロックハイライト
  ;; (require 'ruby-block)
  ;; (add-hook 'enh-ruby-mode-hook 'ruby-block-mode)

  ;; ruby-etc
  (require 'ruby-refactor)
  (eval-after-load "ruby-refactor" (ruby-refactor-mode-launch))
  (require 'ruby-tools)
  (add-hook 'enh-ruby-mode-hook 'ruby-tools-mode)
  (eval-after-load "ruby-tools-mode" (ruby-tools-mode t))
  ;; 括弧のシンタックスハイライト
  (require 'ruby-electric)
  (ruby-electric-mode t)
  (custom-set-variables '(ruby-electric-expand-delimiters-list nil))

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

(autoload 'rspec-mode "rspec-mode" "" t)
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

(provide 'ruby-setting)
;;; ruby-setting.el ends here
