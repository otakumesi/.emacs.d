(el-get-bundle rust-mode)
(require 'rust-mode)

(el-get-bundle toml-mode)
(require 'toml-mode)

(el-get-bundle racer-rust/emacs-racer)
(require 'racer)

(setq racer-rust-src-path "/usr/local/src/rust/src")

(add-hook 'rust-mode-hook #'racer-mode)

(el-get-bundle company-racer)
(require 'company-racer)
(setq company-racer-executable "/usr/local/bin/racer")

(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(el-get-bundle cargo)
(require 'cargo)
(add-hook 'rust-mode-hook 'cargo-minor-mode)

(el-get-bundle flycheck-rust)
(require 'flycheck-rust)

(add-hook 'rust-mode-hook #'rustfmt-enable-on-save)
(add-hook 'rust-mode-hook #'flycheck-rust-setup)

(el-get-bundle rustfmt)
(require 'rustfmt)
