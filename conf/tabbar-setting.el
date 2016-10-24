;;; tabbar-setting.el --- tabbar's settings.
;;; Commentary:

;;; Code:
;; tabbar
(require 'tabbar)
(tabbar-mode 1)
(tabbar-mwheel-backward -1)
(setq tabbar-buffer-groups-function nil)
(global-set-key (kbd "M-<right>") 'tabbar-forward-tab)
(global-set-key (kbd "M-<left>") 'tabbar-backward-tab)

(provide 'tabbar-setting)
;;; tabbar-setting.el ends here
