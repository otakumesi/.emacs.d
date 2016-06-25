(require 'go-mode-autoloads)

(with-eval-after-load "go-mode"
  (require 'golint))

(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)

(autoload 'helm-go-package "helm-go-package")
(eval-after-load 'go-mode
  '(substitute-key-definition 'go-import-add 'helm-go-package go-mode-map))
