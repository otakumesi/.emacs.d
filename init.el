;;; init.el --- initialize file.
;;; Commentary:
;;; Code:

;;; ロードパス:
(setq load-path(append load-path'("~/.emacs.d/conf")))
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

;; key-chordの読み込み
(require 'key-chord)
(key-chord-mode 1)

(load "helm-setting")
(load "elscreen-setting")
(load "evil-setting")
(load "powerline-setting")
(load "company-mode-setting")
(load "yasnippet-setting")
;(load "auto-complete-setting")
(load "ruby-setting")
(load "javascript-setting")
(load "elisp-setting")
(load "web-mode-setting")
;(load "tabbar-setting")
(load "flycheck-setting")
(global-anzu-mode +1)

;;; rbenv
(require 'rbenv)
(global-rbenv-mode)
(rbenv-use-global)

;; projectile
(require 'projectile)
(require 'helm-projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(require 'evil-rails)

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
(require 'neotree)
(global-set-key "\C-x4" 'neotree-toggle)

;; twitter
(require 'twittering-mode)
(setq twittering-use-master-password t)

;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode)

;; rails
(require 'helm-rails)

;; etc
(require 'restclient)

;;; skk
(when (require 'skk nil t)
  (global-set-key "\C-xj" 'skk-auto-fill-mode)
  (setq default-input-method "japanese-skk")
  (require 'skk-study))

;;; linum
(require 'hlinum)
(hlinum-activate)
(global-linum-mode 1)

;;; rainbow-delimiters
(add-hook 'linum-mode-hook 'rainbow-delimiters-mode)

;;; open init.el
(global-set-key (kbd "M-I") (lambda () (interactive)
                              (switch-to-buffer (find-file-noselect "~/.emacs.d/init.el"))))
(global-set-key (kbd "M-W") (lambda () (interactive)
                              (switch-to-buffer (find-file-noselect "~/workspace"))))

;; slime
(require 'slime)
(add-hook 'lisp-mode-hook 'slime-mode)
(slime-setup '(slime-repl slime-fancy slime-banner slime-company))
(setq inferior-lisp-program (executable-find "sbcl"))
(setq slime-lisp-implementations `((sbcl ("sbcl"))
                              (clisp ("clisp"))))
(setq slime-net-coding-system 'utf-8-unix)
(add-hook 'slime-mode-hook 'slime-autodoc-mode)

(setq common-lisp-hyperspec-root (expand-file-name "/usr/local/cellar/hyperspec/7.0/share/doc/hyperspec/HyperSpec"))
(setq common-lisp-hyperspec-symbol-table
      (expand-file-name "/usr/local/cellar/hyperspec/7.0/share/doc/hyperspec/HyperSpec/Data/Map_Sym.txt"))

(defalias 'sl-restart 'slime-restart-inferior-lisp)

 (require 'elisp-slime-nav) ;; optional if installed via package.el
 (dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
   (add-hook hook 'turn-on-elisp-slime-nav-mode))

(require 'flylisp)

;; popwin
(require 'popwin)
(popwin-mode 1)
;(global-set-key (kbd "A-p") (lambda () (popwin:keymap)))

;; psession
(require 'psession)
(psession-mode 1)

(provide 'init)
;;; init.el ends here
