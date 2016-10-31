;;; init.el --- initialize file.
;;; Commentary:
;;; Code:

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;;(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;;(el-get 'sync)

(el-get-bundle fuzzy)
(el-get-bundle dash)
(el-get-bundle emacs-async)
(el-get-bundle fullscreen-mode)

;;(require 'package)
;;(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;;(package-initialize)

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;;; ロードパス:
(add-to-list 'load-path "~/.emacs.d/conf")
(setq gc-cons-threshold (* 128 1024 1024))
(load "user-setting")
(tool-bar-mode -1)

(let ((gls "/usr/local/bin/gls"))
  (if (file-exists-p gls) (setq insert-directory-program gls)))

(setq default-frame-alist
      (append (list '(width . 100)
                    '(height . 48))
              default-frame-alist))

;;(load "package-setting")
;;(load "el-get-setting")
(el-get-bundle restart-emacs)

;; shell
(el-get-bundle exec-path-from-shell)
(when (memq window-system '(mac ns))
  (let ((envs '("PATH" "GOPATH")))
    (exec-path-from-shell-copy-envs envs))
  (exec-path-from-shell-initialize))
(load-file "~/.emacs.d/shellenv.el")

;; カラーテーマ
(el-get-bundle solarized-emacs)
(require 'solarized)
(setq solarized-high-contrast-mode-line t)
(load-theme 'solarized-dark t)
(setq ns-use-srgb-colorspace nil)

;; key-chordの読み込み
(el-get-bundle key-chord)
(require 'key-chord)
(key-chord-mode 1)

;; projectile
(el-get-bundle 'projectile)
(require 'projectile)
(el-get-bundle 'helm-projectile)
(require 'helm-projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(require 'eldoc)
(eldoc-mode)
(el-get-bundle eldoc-extension)
(require 'eldoc-extension)
(setq eldoc-idle-delay 0)
(setq eldoc-echo-area-use-multiline-p t)
(el-get-bundle anzu)

(load "helm-setting")
(el-get-bundle evil)
(load "evil-setting")
(load "powerline-setting")
(load "flycheck-setting")
(load "company-mode-setting")
(el-get-bundle yasnippet)
(load "yasnippet-setting")
(load "web-mode-setting")
(load "ruby-setting")
(load "javascript-setting")
;; (load "golang-setting")
(load "scala-setting")
;; (load "haskell-setting")
(load "elisp-setting")
(load "c-setting")
(load "markdown-setting")
(global-anzu-mode +1)
(load "elscreen-setting")

;; fullscreen
(global-set-key (kbd "C-;") 'fullscreen-mode-fullscreen-toggle)

;; windmov
(require 'windmove)
(global-set-key (kbd "S-<up>") 'windmove-up)
(global-set-key (kbd "S-<down>") 'windmove-down)
(global-set-key (kbd "S-<right>") 'windmove-right)
(global-set-key (kbd "S-<left>") 'windmove-left)

;; buffer-move
(el-get-bundle buffer-move)
(require 'buffer-move)
(global-set-key (kbd "<C-S-up>") 'buf-move-up)
(global-set-key (kbd "<C-S-down>") 'buf-move-down)
(global-set-key (kbd "<C-S-right>") 'buf-move-right)
(global-set-key (kbd "<C-S-left>") 'buf-move-left)

;; Magitの読み込み
(el-get-bundle magit/magit)
(el-get-bundle justbur/evil-magit)
(require 'magit)
(require 'evil-magit)
(global-set-key (kbd "M-m") prefix-arg)
(global-set-key (kbd "M-m m") 'magit-status)
(global-set-key (kbd "M-m i") 'magit-init)

;; TreeのElisp
;; (require 'neotree)
;; (global-set-key "\C-x4" 'neotree-toggle)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; etc
;; (require 'restclient)

;;; skk
(when (require 'skk nil t)
  (global-set-key "\C-xj" 'skk-auto-fill-mode)
  (with-eval-after-load 'skk-auto-fill-mode
    (setq default-input-method "japanese-skk")
    (require 'skk-study)))

;;; linum
(el-get-bundle tom-tan/hlinum-mode)
(require 'hlinum)
(setq linum-delay t)
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))
(hlinum-activate)
(global-linum-mode 1)

;;; open init.el
(global-set-key (kbd "M-I") (lambda () (interactive)
                              (switch-to-buffer (find-file-noselect "~/.emacs.d/init.el"))))
(global-set-key (kbd "M-W") (lambda () (interactive)
                              (switch-to-buffer (find-file-noselect "~/workspace"))))

;; popwin
(el-get-bundle popwin)
(require 'popwin)
(popwin-mode 1)
;(global-set-key (kbd "A-p") (lambda () (popwin:keymap)))

(el-get-bundle org)
(require 'org)
(load "org-setting")

(el-get-bundle org)
(autoload 'puml-mode "puml-mode" "" t)
(add-to-list 'auto-mode-alist '("\\.puml$" . puml-mode))

(el-get-bundle quickrun)
(require 'quickrun)

;;; open memo
(global-set-key (kbd "C-c C-m") (lambda () (interactive)
                                  (switch-to-buffer (find-file-noselect "~/memo/memo.org"))))

(el-get-bundle dockerfile-mode)
(require 'dockerfile-mode)
(el-get-bundle docker-tramp)
(require 'docker-tramp)

;; (require 'server)
;; (unless (server-running-p)
;;   (server-start))

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-disable-checker (quote (javascript-jshint javascript-jscs)))
 '(package-selected-packages
   (quote
    (inflections fullscreen-mode org robe package-lint magit-popup git-commit evil-smartparens)))
 '(ruby-electric-expand-delimiters-list nil)
 '(ruby-insert-encoding-magic-comment nil)
 '(ruby-program "~/.rbenv/shims/ruby"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:foreground "#002b36" :background "#268bd2" :box nil))))
 '(mode-line-inactive ((t (:foreground "#002b36" :background "#268bd2" :box nil)))))
