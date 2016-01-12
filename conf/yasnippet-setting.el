;;; yasnippet-setting.el --- yasinippet's settings.
;;; Commentary:

;;; Code:
;(require 'yasnippet-bundle)
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")
(yas-global-mode 1)

(provide 'yasnippet-setting)
;;; yasnippet-setting.el ends here
