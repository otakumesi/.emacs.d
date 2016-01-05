;; 行番号を表示させる
(global-linum-mode t)

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
