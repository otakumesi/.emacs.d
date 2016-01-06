;; enh-ruby-modeでRubyモードを導入する
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

;; Rubyのブロックハイライト
(require 'ruby-block)
(ruby-block-mode t)
