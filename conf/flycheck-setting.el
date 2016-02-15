;;; flycheck-setting.el --- flycheck's settings.
;;; Commentary:

;;; Code:

;; flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(flycheck-add-next-checker 'javascript-jshint
                           'javascript-gjslint)

(require 'flycheck-color-mode-line)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

(eval-after-load 'flycheck
  '(flycheck-package-setup))

(with-eval-after-load 'flycheck
  '(flycheck-pos-tip-mode))

(flycheck-define-checker ruby-rubocop
  "A Ruby syantax and style checker using the RuboCop tool."
  :command ("rubocop" "--format" "emacs"
           (config-file "--config" flycheck-rubocoprc)
           source)
  :standard-input t
  :error-patterns
  ((warning line-start
            (file-name) ":" line ":" (or "C" "W") ":" (message)
            line-end)
   (error line-start
          (file-name) ":" line ":" (or "C" "W") ":" (message)
          line-end))
  :modes (enh-ruby-mode motion-mode))

(flycheck-define-checker ruby-rubylint
  "A Ruby syantax and style checker using the rubyline tool."
  :command ("ruby-lint" source)
  :error-patterns
  ((warning line-start
            (file-name) ":" line ":" column ":" (or "C" "W") ":" (message)
            line-end)
   (error line-start
          (file-name) ":" line ":" column ":" (or "C" "W") ":" (message)
          line-end))
  :modes (enh-ruby-mode ruby-mode))

(provide 'flycheck-setting)
;;; flycheck-setting.el ends here
