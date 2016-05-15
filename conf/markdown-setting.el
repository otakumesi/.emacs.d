;;; markdown-setting.el --- web-mode's settings.
;;; Commentary:

;;; Code:
;;; markdown
(defun eww-open-file-other-window (file)
  (if (one-window-p) (split-window))
    (other-window 1)
    (eww-open-file file))

(defun markdown-preview-eww ()
  (interactive)
  (message (buffer-file-name))
  (save-buffer)
  (call-process "/usr/local/bin/grip" nil nil nil
                (buffer-file-name) "--export" "/tmp/grip.html")
  (eww-open-file-other-window "/tmp/grip.html"))

(with-eval-after-load "markdown-mode"
  (define-key markdown-mode-map (kbd "C-c m") 'markdown-preview-eww))

(provide 'markdown-setting)
;;; markdown-setting.el ends here
