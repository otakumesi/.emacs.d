(setq org-plantuml-jar-path "/usr/local/Cellar/plantuml/8041/plantuml.8041.jar")
(defun org-mode-init ()
  (org-babel-do-load-languages
   'org-babel-load-languages
   (add-to-list 'org-babel-load-languages '(plantuml . t))))
(add-hook 'org-mode-hook 'org-mode-init)
(provide 'org-setting)
;;; org-setting.el ends here
