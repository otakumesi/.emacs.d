;;; elscreen-setting.el --- elscreen's settings.
;;; Commentary:

;;; Code:
;; elscreenの読み込み
(require 'elscreen)
(setq elscreen-prefix-key (kbd "C-,"))
(elscreen-start)
(setq elscreen-tab-display-control nil)
(setq elscreen-buffer-to-nickname-alist
      '(("^dired-mode$" .
         (lambda ()
           (format "Dired(%s)" dired-directory)))
        ("^Info-mode$" .
         (lambda ()
           (format "Info(%s)" (file-name-nondirectory Info-current-file))))
        ("^mew-draft-mode$" .
         (lambda ()
           (format "Mew(%s)" (buffer-name (current-buffer)))))
        ("^mew-" . "Mew")
        ("^irchat-" . "IRChat")
        ("^liece-" . "Liece")
        ("lookup-" . "Lookup")))
(setq elscreen-mode-to-nickname-alist
      '(("[Ss]hell" . "shell")
        ("compilation" . "compile")
        ("-telnet" . "telnet")
        ("dict" . "OnlineDict")
        ("*WL:Message*" . "Wanderlust")))

(global-set-key (kbd "C-<right>") 'elscreen-next)
(global-set-key (kbd "C-<left>") 'elscreen-previous)
(global-set-key (kbd "C-<up>") 'elscreen-clone)
(global-set-key (kbd "C-<down>") 'elscreen-kill)

(provide 'elscreen-setting)
;;; elscreen-setting.el ends here
