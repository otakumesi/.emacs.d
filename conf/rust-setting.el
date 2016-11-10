(el-get-bundle rust-mode)
(require 'rust-mode)

(el-get-bundle toml-mode)
(require 'toml-mode)

(el-get-bundle emacs-racer
  :git
  :url "git@github.com:racer-rust/emacs-racer.git")
(require 'racer)

(el-get-bundle cargo)
(require 'cargo)
(add-hook 'rust-mode-hook 'cargo-minor-mode)

(setq racer-rust-src-path "/usr/local/src/rust/src")

(add-hook 'rust-mode-hook #'racer-mode)

(el-get-bundle company-racer)
(require 'company-racer)
(setq company-racer-executable "/usr/local/bin/racer")
(add-to-list 'company-backends 'company-racer)

(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)


(el-get-bundle flycheck-rust)
(require 'flycheck-rust)

(el-get-bundle rustfmt)
(require 'rustfmt)

(add-hook 'rust-mode-hook #'rustfmt-enable-on-save)
(add-hook 'rust-mode-hook #'flycheck-rust-setup)
