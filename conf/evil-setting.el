;; Evilの読み込み
(require 'evil)
(evil-mode 1)

(require 'powerline-evil)

(setq key-chord-two-keys-delay 0.3)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

(require 'smartparens-config)
(smartparens-global-mode t)
(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)

