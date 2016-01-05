;; Evilの読み込み
(require 'evil)
(evil-mode 1)

(setq key-chord-two-keys-delay 0.3)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
