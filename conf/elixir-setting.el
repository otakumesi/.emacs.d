(el-get-bundle elixir-mode)
(require 'elixir-mode)

(el-get-bundle alchemist)
(require 'alchemist)

(setq alchemist-mix-command "")
(setq alchemist-mix-test-task "")

(setq alchemist-hooks-text-on-save t)
(setq alchemist-hooks-compine-on-save t)

(el-get-bundle lbolla/emacs-flycheck-elixir)
(require 'flycheck-elixir)
