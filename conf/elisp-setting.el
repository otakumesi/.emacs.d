;; emacs-lisp-modeの設定
(add-to-list 'auto-mode-alist '("\\.el$" . emacs-lisp-mode))

;; slime
;; (with-eval-after-load 'lisp-mode
;;   (require 'slime)
;;   (load (expand-file-name "~/.roswell/impls/ALL/ALL/quicklisp/slime-helper.el"))
;;   (setq common-lisp-hyperspec-root (expand-file-name "/usr/local/cellar/hyperspec/7.0/share/doc/hyperspec/HyperSpec"))
;;   (setq common-lisp-hyperspec-symbol-table
;;         (expand-file-name "/usr/local/cellar/hyperspec/7.0/share/doc/hyperspec/HyperSpec/Data/Map_Sym.txt"))
;;   (require 'common-lisp-snippets))

;; (with-eval-after-load 'slime
;;   (slime-mode t)
;;   (defalias 'sl-restart 'slime-restart-inferior-lisp)
;;   (require 'elisp-slime-nav))

;; (with-eval-after-load 'slime
;;   (slime-setup '(slime-repl slime-fancy slime-banner slime-company))
;;   (setq slime-net-coding-system 'utf-8-unix)
;;   (add-hook 'slime-mode-hook 'slime-autodoc-mode))
;; (with-eval-after-load 'inferior-lisp-mode
;;   (inferior-slime-mode t)
;;   (setq inferior-lisp-program "ros -L sbcl -Q run -l ~/.sbclrc"))

;; (dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
;;   (add-hook hook 'turn-on-elisp-slime-nav-mode))

;;; rainbow-delimiterm
(require 'rainbow-delimiters)
(add-hook 'after-init-hook 'rainbow-delimiters-mode)
(require 'cl-lib)
(require 'color)
(cl-loop
 for index from 1 to rainbow-delimiters-max-face-count
 do
 (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
                             (cl-callf color-saturate-name (face-foreground face) 30)))

