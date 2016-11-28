(el-get-bundle elixir-mode)
(require 'elixir-mode)

(el-get-bundle alchemist)
(require 'alchemist)

(setq alchemist-mix-command "")
(setq alchemist-mix-test-task "")

(setq alchemist-hooks-text-on-save t)
(setq alchemist-hooks-compine-on-save t)

(el-get-bundle ruby-end)
(require 'ruby-end)
(add-hook 'elixir-mode-hook '(lambda ()
                              (set (make-variable-buffer-local 'ruby-end-expand-keywords-before-re) "\\(?:^\\|\\s-+\\)\\(?:do\\)" )
                              (set (make-variable-buffer-local 'ruby-end-check-statement-modifiers))
                              (ruby-end-mode +1)))

(el-get-bundle lbolla/emacs-flycheck-elixir)
(require 'flycheck-elixir)

(el-get-bundle otakumesi/flycheck-elixir-dialyxir)
(require 'flycheck-elixir-dialyxir)

(add-to-list 'flycheck-checkers 'elixir 'elixir-dialyxir)

(el-get-bundle smartparens)
(el-get-bundle evil-smartparens)
(require 'smartparens-config)
(add-hook 'elixir-mode-hook 'smartparens-mode)
(add-hook 'smartparens-enabled-hook 'evil-smartparens-mode)
