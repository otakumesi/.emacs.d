(el-get-bundle elixir-mode)
(require 'elixir-mode)

(el-get-bundle alchemist)
(require 'alchemist)

(setq alchemist-mix-command "/usr/local/bin/mix")
(setq alchemist-iex-program-name "/usr/local/bin/iex")
(setq alchemist-execute-command "/usr/local/bin/elixir")
(setq alchemist-compile-command "/usr/local/bin/elixirc")

(setq alchemist-hooks-text-on-save t)
(setq alchemist-hooks-compine-on-save t)

(el-get-bundle ruby-end)
(require 'ruby-end)
(el-get-bundle lbolla/emacs-flycheck-elixir)
(add-hook 'elixir-mode-hook '(lambda ()
                               (alchemist-mode t)
                               (add-to-list 'flycheck-checkers 'elixir-dogma)
                               ;; (set (make-variable-buffer-local 'ruby-end-expand-keywords-before-re) "\\(?:^\\|\\s-+\\)\\(?:do\\)" )
                               ;; (set (make-variable-buffer-local 'ruby-end-check-statement-modifiers))
                               (setq company-minimum-prefix-length 1)
                               (ruby-end-mode +1)))

;; (el-get-bundle otakumesi/flycheck-elixir-dialyxir)
;; (require 'flycheck-elixir-dialyxir)

;; (add-to-list 'flycheck-checkers 'elixir-dogma 'elixir-dialyxir)
;; (flycheck-add-next-checker 'elixir-dogma 'elixir-dialyxir)
(add-to-list 'auto-mode-alist '("\\.eex$" . web-mode))

(el-get-bundle hisea/elixir-yasnippets)
(require 'elixir-yasnippets)

(provide 'elixir-setting)
;;; elixir-setting.el ends here
