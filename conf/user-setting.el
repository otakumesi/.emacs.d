;;; package --- Summary
;;; Commentary:

;;; Code:
;; フォント設定
(set-face-attribute 'default
                    nil
                    :family "Roboto Mono Light for Powerline"
                    :height 120)

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
(setq tab-width 2)

;; バックアップファイルを作らない
(setq backup-inhibited t)

;; ファイル名補完で大文字小文字を区別しない
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; C-jで補完
(global-set-key "\C-j" 'dabbrev-expand)

;; インデントをタブからスペースに変更
(setq-default indent-tabs-mode nil)

;; 行末の空白をハイライト
(setq-default show-trailing-whitespace t)

;; ウィンドウの大きさ変更キーの簡易化割当（オプションキー + 矢印キー）
(global-set-key [(s up)] '(lambda (arg) (interactive "p") (shrink-window arg)))
(global-set-key [(s down)] '(lambda (arg) (interactive "p") (shrink-window (- arg))))
(global-set-key [(s left)] '(lambda (arg) (interactive "p") (shrink-window-horizontally (- arg))))
(global-set-key [(s right)] '(lambda (arg) (interactive "p") (shrink-window-horizontally arg)))

;; ブラウザを開く設定
(defun open-browser ()
  (interactive)
  (shell-command (concat "open " (buffer-file-name))))
(global-set-key (kbd "M-n") 'open-browser)

;; 現在行のハイライト
(require 'hl-line)
(defun global-hl-line-timer-function ()
  (global-hl-line-unhighlight-all)
  (let ((global-hl-line-mode t))
        (global-hl-line-highlight)))
(setq global-hl-line-timer
    (run-with-idle-timer 0.03 t 'global-hl-line-timer-function))
;; (cancel-timer global-hl-line-timer)

(provide 'user-setting)
;;; user-setting.el ends here
