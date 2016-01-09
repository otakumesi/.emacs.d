;; flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(flycheck-add-next-checker 'javascript-jshint
                           'javascript-gjslint)
