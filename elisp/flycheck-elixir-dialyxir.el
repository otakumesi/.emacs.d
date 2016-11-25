;;; flycheck-elixir-dialyxir.el --- Support dialyxir in flycheck

;; Copyright (C) 2016 Takuro Niitsuma
;;
;; Author: Takuro Niitsuma <bakednt@gmail.com>
;; Version: 0.1.0
;; URL: https://github.com/Otakumesi/flycheck-elixir-dialyxir/
;; Package-Requires: ((flycheck "0.23") (elixir-mode "1.0.0"))

;;; Commentary:

;;; This package adds support for dialyxir to flycheck.

;;; Code:
(require 'flycheck)

(defun flycheck-elixir-dialyxir--mix-project-root (_checker)
  "This method get the mix-project-root from current directory."
  (or
   (and
    buffer-file-name
    (locate-dominating-file buffer-file-name "mix.exs"))
   default-directory))

(flycheck-define-checker elixir-dialyxir
  "Elixir Static Analysis Checker."
  :command ("mix" "dialyzer" "--fullpath")
  :working-directory flycheck-elixir-dialyxir--mix-project-root
  :error-patterns ((info line-start (file-name) ":" line ": " (message) line-end))
  :modes elixir-mode)

(add-to-list 'flycheck-checkers 'elixir-dialixir)

(provide 'flycheck-elixir-dialyxir)
;;; flycheck-elixir-dialyxir.el ends here
