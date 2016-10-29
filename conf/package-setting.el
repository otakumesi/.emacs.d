;;; package-setting.el --- package.el's setting file
;;; Commentary:

;;; Code:
(require 'package)
(add-to-list 'package-archives
                    '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; インストールするパッケージ
;; パッケージの設定・インストール等
(autoload 'auto-async-byte-compile "auto-async-byte-compile")
(with-eval-after-load 'auto-async-byte-compile
  (setq auto-async-byte-compile-init-file "~/.emacs.d/init.el")
  (setq auto-async-byte-compile-exclude-files-regexp "~/.emacs.d/init.el")
  (setq auto-async-byte-compile-exclude-files-regexp "~/.emacs.d/conf/package-setting.el")
  (add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode))
(add-hook 'kill-emacs-hook 'auto-async-byte-compile)

(provide 'package-setting)
;;; package-setting.el ends here
