;; emacs-lisp-modeの設定
(add-to-list 'auto-mode-alist '("\\.el$" . emacs-lisp-mode))

;; slime
(require 'slime)
(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
(slime-setup '(slime-repl slime-fancy slime-banner slime-company))
(load (expand-file-name "~/.roswell/impls/ALL/ALL/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "ros -L sbcl -Q run -l ~/.sbclrc")
(setq slime-net-coding-system 'utf-8-unix)
(add-hook 'slime-mode-hook 'slime-autodoc-mode)

(setq common-lisp-hyperspec-root (expand-file-name "/usr/local/cellar/hyperspec/7.0/share/doc/hyperspec/HyperSpec"))
(setq common-lisp-hyperspec-symbol-table
      (expand-file-name "/usr/local/cellar/hyperspec/7.0/share/doc/hyperspec/HyperSpec/Data/Map_Sym.txt"))

(defalias 'sl-restart 'slime-restart-inferior-lisp)

(require 'elisp-slime-nav) ;; optional if installed via package.el
(dolist (hook '(emacs-lisp-mode-hook ielm-mode-hook))
  (add-hook hook 'turn-on-elisp-slime-nav-mode))

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

