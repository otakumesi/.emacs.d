;;; init.el --- initialize file.
;;; Commentary:
;;; Code:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;; (package-initialize)

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
(el-get-bundle deferred)
(el-get-bundle use-package)

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path "~/.emacs.d/conf")
(setq gc-cons-threshold (* 128 1024 1024))
(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta)))
;; (load "user-setting")

(defun user-settings ()
  ;; フォント設定
  (set-face-attribute 'default
                      nil
                      :family "Roboto Mono Light for Powerline"
                      :height 140)

  ;; 対応する括弧を光らせる
  (show-paren-mode 1)

  ;; バッファの終端を明示する
  (setq indicate-empty-lines t)

  ;; yes-noをy-nに置き換え
  (fset 'yes-or-no-p 'y-or-n-p)

  ;; M-xでコマンドを入力する時に候補を表示する
  (icomplete-mode 1)

  ;; status-barにカーソルの位置を表示
  (column-number-mode t)

  ;; インデントをタブからスペースに
  (setq-default indent-tabs-mode nil)
  ;; (setq-default tab-width 2)

  ;; バックアップファイルを作らない
  (setq backup-inhibited t)

  ;; ファイル名補完で大文字小文字を区別しない
  (setq read-buffer-completion-ignore-case t)
  (setq read-file-name-completion-ignore-case t)

  ;; インデントをタブからスペースに変更
  (setq-default indent-tabs-mode nil)

  ;; 行末の空白をハイライト
  (setq-default show-trailing-whitespace t)

  ;; ウィンドウの大きさ変更キーの簡易化割当（オプションキー + 矢印キー）
  (global-set-key [(s up)] '(lambda (arg) (interactive "p") (shrink-window arg)))
  (global-set-key [(s down)] '(lambda (arg) (interactive "p") (shrink-window (- arg))))
  (global-set-key [(s left)] '(lambda (arg) (interactive "p") (shrink-window-horizontally (- arg))))
  (global-set-key [(s right)] '(lambda (arg) (interactive "p") (shrink-window-horizontally arg)))

  ;; 現在行のハイライト
  (require 'hl-line)
  (defun global-hl-line-timer-function ()
    (global-hl-line-unhighlight-all)
    (let ((global-hl-line-mode t))
      (global-hl-line-highlight)))
  (setq global-hl-line-timer
        (run-with-idle-timer 0.03 t 'global-hl-line-timer-function))

  (require 'font-lock)
  (global-font-lock-mode t))
;; end user-settings

(user-settings)
(global-set-key (kbd "C-S-f") 'forward-word)
(global-set-key (kbd "C-S-b") 'backward-word)
(global-set-key (kbd "C-S-d") 'kill-region)
(keyboard-translate ?\C-h ?\C-?)
(keyboard-translate ?\M-h ?\M-?)

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

(load "elscreen-setting")

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

;; (el-get-bundle auto-complete)
;; (require 'auto-complete)
;; (setq ac-auto-start nil)

(load "helm-setting")
;; (el-get-bundle evil)
;; (load "evil-setting")
(load "powerline-setting")
(load "flycheck-setting")
(load "company-mode-setting")
(el-get-bundle yasnippet)
(load "yasnippet-setting")
(load "web-mode-setting")
(load "ruby-setting")
(load "javascript-setting")
;; (load "golang-setting")
;; (load "scala-setting")
(load "elixir-setting")
(load "rust-setting")
(load "haskell-setting")
(load "elisp-setting")
(load "c-setting")
(load "markdown-setting")
(global-anzu-mode +1)

;;smartparens
(el-get-bundle smartparens)
;; (el-get-bundle evil-smartparens)
(require 'smartparens-config)

(cl-dolist (hook (list
                  'emacs-lisp-mode-hook
                  'c-mode-hook
                  'elixir-mode-hook
                  'javascript-mode-hook
                  'js2-mode-hook
                  'js2-jsx-mode-hook
                  'typescript-mode-hook
                  'web-mode-hook
                  'coffee-mode-hook
                  'go-mode-hook
                  'haskell-mode-hook
                  'scala-mode-hook))
  (add-hook hook #'smartparens-mode))
;; (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)

;; fullscreen
(global-set-key (kbd "C-;") 'fullscreen-mode-fullscreen-toggle)

;; expand-region
(el-get-bundle magnars/expand-region.el)
(global-set-key (kbd "C-@") 'er/expand-region)

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
;; (el-get-bundle justbur/evil-magit)
(require 'magit)
;; (require 'evil-magit)
(global-set-key (kbd "M-m") prefix-arg)
(global-set-key (kbd "M-m m") 'magit-status)
(global-set-key (kbd "M-m i") 'magit-init)

;; TreeのElisp
;; (require 'neotree)
;; (global-set-key "\C-x4" 'neotree-toggle)

;; undo-tree
(el-get-bundle undo-tree)
(require 'undo-tree)
(global-undo-tree-mode)

;; etc
;; (require 'restclient)

;;; skk
;; (when (require 'skk nil t)
;;   (global-set-key "\C-xj" 'skk-auto-fill-mode)
;;   (with-eval-after-load 'skk-auto-fill-mode
;;     (setq default-input-method "japanese-skk")
;;     (require 'skk-study)))

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

(el-get-bundle gitignore-mode)
(require 'gitignore-mode)

;; 日本語入力
(el-get-bundle mozc)
(require 'mozc)
(setq default-input-method "japanese-mozc")

(el-get-bundle mozc-popup)
(require 'mozc-popup)

(setq mozc-cached-header-line-height 'popup)

(el-get-bundle markdown-mode)
(require 'markdown-mode)

(el-get-bundle yaml-mode)
(require 'yaml-mode)

(el-get-bundle google-translate)
(require 'google-translate)
(global-set-key (kbd "C-c t") 'google-translate-at-point)

(el-get-bundle hackernews)
(require 'hackernews)

;; (load "pm-strategy")

(el-get-bundle migemo)
(require 'migemo)
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-user-dictionary nil)
(setq migemo-coding-system 'utf-8)
(setq migemo-regex-dictionary nil)
(load-library "migemo")
(migemo-init)

(el-get-bundle mozc)
(require 'mozc)
(setq default-input-method "japanese-mozc")
(setq mozc-helper-program-name "/usr/local/bin/mozc_emacs_helper")

;; (add-to-list 'load-path "~/.emacs.d/elisp")
;; (load "drill-instructor")

;; (define-key hackernews-map (kbd "C-c h e") '(lambda () (eww-browse-url (hackernews-comment-url))))
(setq hippie-expand-try-functions-list
      '(yas/hippie-try-expand
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-list try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

(el-get-bundle haxney/smart-tab)
(require 'smart-tab)
(global-smart-tab-mode 1)
(setq smart-tab-using-hippie-expand 1)

(global-set-key (kbd "C-?") 'undo-tree-redo)

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
    (hackernews rustfmt robe package-lint org mozc-popup inflections gitignore-mode fullscreen-mode f evil-smartparens elixir-mode company-racer)))
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
