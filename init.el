;;; init.el --- initialize file.
;;; Commentary:
;;; Code:

;;; ロードパス:
(add-to-list 'load-path "~/.emacs.d/conf")
(setq gc-cons-threshold (* 128 1024 1024))
(load "user-setting")

(setq default-frame-alist
      (append (list '(width . 182)
                    '(height . 48))
              default-frame-alist))

(load "package-setting")
;;(load "el-get-setting")

;; shell
;(load-file "~/.emacs.d/shellenv.el")
(when (memq window-system '(mac ns))
  (let ((envs '("PATH" "GOPATH")))
    (exec-path-from-shell-copy-envs envs))
  (exec-path-from-shell-initialize))

;; カラーテーマ
(require 'solarized)
(setq solarized-high-contrast-mode-line t)
(load-theme 'solarized-dark t)
(setq ns-use-srgb-colorspace nil)

;; key-chordの読み込み
(require 'key-chord)
(key-chord-mode 1)

;; projectile
(require 'projectile)
(require 'helm-projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(require 'eldoc)
(require 'eldoc-extension)
(setq eldoc-idle-delay 0)
(setq eldoc-echo-area-use-multiline-p t)

(load "helm-setting")
(load "evil-setting")
(load "powerline-setting")
(load "flycheck-setting")
(load "company-mode-setting")
(load "yasnippet-setting")
(load "web-mode-setting")
(load "ruby-setting")
(load "javascript-setting")
(load "golang-setting")
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
(require 'buffer-move)
(global-set-key (kbd "<C-S-up>") 'buf-move-up)
(global-set-key (kbd "<C-S-down>") 'buf-move-down)
(global-set-key (kbd "<C-S-right>") 'buf-move-right)
(global-set-key (kbd "<C-S-left>") 'buf-move-left)

;; Magitの読み込み
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
(require 'popwin)
(popwin-mode 1)
;(global-set-key (kbd "A-p") (lambda () (popwin:keymap)))

(require 'org)
(load "org-setting")

(autoload 'puml-mode "puml-mode" "" t)
(add-to-list 'auto-mode-alist '("\\.puml$" . puml-mode))

(require 'quickrun)

;; (require 'server)
;; (unless (server-running-p)
;;   (server-start))

(provide 'init)
;;; init.el ends here
