;; cc-mode
(require 'cc-mode)
(autoload 'cc-mode "cc-mode")
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq c-default-style "k&r")
            (setq indent-tabs-mode t)
            (setq c-basic-offset 2)))
