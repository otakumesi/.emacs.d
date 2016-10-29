;;; PACKAGE --- Summary
;;; Commentary:

;; Code:
(el-get-bundle auto-complete)
(require 'auto-complete)
(el-get-bundle auto-complete-config)
(require 'auto-complete-config)
(auto-complete-mode t)
(ac-config-default)
(setq ac-use-menu-map t)
(setq ac-use-fuzzy t)

(provide 'auto-complete-setting)
;;; auto-complete-setting.el ends here
