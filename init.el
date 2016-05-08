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

;; 鬼軍曹の設置
;; (require 'drill-instructor)
;; (setq drill-instructor-global t)

(load "package-setting")

;; shell
;(load-file "~/.emacs.d/shellenv.el")
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; カラーテーマ
;(when (require 'color-theme)
;  (color-theme-initialize)
;  (when (require 'color-theme-solarized)
;    (color-theme-solarized)
;    (set-frame-parameter nil 'background-mode 'dark)))
(require 'solarized)
(setq solarized-high-contrast-mode-line t)
(load-theme 'solarized-dark t)
(setq ns-use-srgb-colorspace nil)

;; key-chordの読み込Process *esup* killed: 9

(require 'key-chord)
(key-chord-mode 1)

;; projectile
(require 'projectile)
(require 'helm-projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(load "helm-setting")
(load "elscreen-setting")
(load "evil-setting")
(load "company-mode-setting")
(load "yasnippet-setting")
(load "ruby-setting")
(load "javascript-setting")
(load "haskell-setting")
(load "elisp-setting")
(load "c-setting")
(load "web-mode-setting")
(load "flycheck-setting")
(global-anzu-mode +1)
(load "powerline-setting")

;; fullscreen
(global-set-key (kbd "C-;") 'fullscreen-mode-fullscreen-toggle)

;; windmove
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

;; psession
;; (require 'psession)
;; (psession-mode 1)

(require 'org)

(require 'quickrun)

(require 'server)
(unless (server-running-p)
  (server-start))

;; modeline
(defvar modeline-formating ()
  (list ""
   'mode-line-modified
   'mode-line-buffer-identification
   "   "
   'global-mode-string
   "   %[("
   'mode-name 'minor-mode-alist "%n" 'mode-line-process
   ")%]----"
   '(-3 . "%p")
   "-%-"))


(defun mode-line-setting ()
  (interactive)
  (setq mode-line-frame-identification nil)
  (setq-default mode-line-format modeline-formating)
  )
(mode-line-setting)

(provide 'init)
;;; init.el ends here
