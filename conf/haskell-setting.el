;;; haskell-setting.el --- haskell-mode's setting.
;;; Commentary:

;;; Code:
(autoload 'haskell-mode "haskell-mode")
(autoload 'haskell-cabal "haskell-cabal")

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)

(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal\\'" . haskell-cabal-mode))

(with-eval-after-load 'haskell-mode
  (setq haskell-program-name "/usr/bin/ghci")
  (add-to-list 'interpreter-mode-alist '("runghc" . haskell-mode))
  (add-to-list 'interpreter-mode-alist '("runhaskell" . haskell-mode))
  (define-key haskell-mode-map [f8] 'haskell-navigate-imports)
  (define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile)
  (define-key haskell-mode-map (kbd "C-c C-o") 'haskell-compile)
  (ghc-init)
  (add-to-list 'company-backends 'company-ghc)
  (custom-set-variables '(company-ghc-show-info t))
  (custom-set-variables '(haskell-tags-on-save t))
  (add-hook 'haskell-mode-hook 'hindent-mode)
  (add-hook 'haskell-mode-hook 'subword-mode))

(with-eval-after-load 'haskell-cabal
  (let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
    (setenv "PATH" (concat my-cabal-path path-separator (getenv "PATH")))
    (add-to-list 'exec-path my-cabal-path))
  (custom-set-variables '(haskell-process-type 'cabal-repl)))


;;(require 'shm)
;;(add-hook 'haskell-mode-hook 'structured-haskell-mode)

;;; haskell-setting.el ends here
