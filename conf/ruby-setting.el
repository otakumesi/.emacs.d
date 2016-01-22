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

;; Rubyのブロックハイライト
(require 'ruby-block)
(ruby-block-mode t)

;; 括弧のシンタックスハイライト
(require 'ruby-electric)
(add-hook 'enh-ruby-mode-hook '(lambda() (ruby-electric-mode t)))

;; Robeの起動
(add-hook 'enh-ruby-mode-hook 'robe-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends))

(require 'rspec-mode)
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

(provide 'ruby-setting)
;;; ruby-setting.el ends here
