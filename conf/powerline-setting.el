;;; package --- Summary
;;; Commentary:

;;; Code:
;; powerline.elの読み込み
(require 'powerline)
(powerline-default-theme)

(custom-set-faces
 '(mode-line ((t (:foreground "#002b36" :background "#268bd2" :box nil))))
 '(mode-line-inactive ((t (:foreground "#002b36" :background "#268bd2" :box nil)))))

(set-face-attribute 'modeline-highlight nil
                    :foreground "#002b36"
                    :background "#6c71c4"
                    :inherit 'mode-line)

(set-face-attribute 'powerline-active1 nil
                    :foreground "#002b36"
                    :background "#b58900"
                    :inherit 'mode-line)

(set-face-attribute 'powerline-active2 nil
                    :foreground "#002b36"
                    :background "#859900"
                    :inherit 'mode-line)

(set-face-attribute 'powerline-inactive1 nil
                    :foreground "#002b36"
                    :background "#b58900"
                    :inherit 'mode-line)

(set-face-attribute 'powerline-inactive2 nil
                    :foreground "#002b36"
                    :background "#859900"
                    :inherit 'mode-line)

(set-face-attribute 'mode-line nil
                    :overline  "#268bd2"
                    :foreground "#002b36"
                    :background "#268bd2"
                    :box nil)

(set-face-attribute 'mode-line-buffer-id nil
                    :foreground "#002b36"
                    :background "#268bd2"
                    :inherit 'mode-line)

(set-face-attribute 'modeline-inactive nil
                    :foreground "#002b36"
                    :background "#268bd2"
                    :inherit 'mode-line)

(provide 'powerline-setting)
;;; powerline-setting.el ends here
