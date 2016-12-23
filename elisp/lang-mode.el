(defclass lang-mode
  (mode nil)
  (parens-set (make-paresn-set mode parens-list))
  (auto-mode nil)
  (flycheck nil))

(defclass parens-set
  (parenses '()))

(defmethod invoke-parens-sets ((parens-set parens-set))
  (setq parenses (slot-value parens-set 'parenses))
  (map parenses #'invoke-parens-set))

(defmethod invoke-parens-set ((parens-set parens-set))
  (el-get-bundle smartparens) ;; このbundleの抽象化も必要 caskとpackageに対応？ interfaceを作ってみる
  (el-get-bundle evil-smartparens)
  (require 'smartparens-config)
  (add-hook 'elixir-mode-hook #'smartparens-mode) ;; 親クラスのmodeを取得する
  (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode))
