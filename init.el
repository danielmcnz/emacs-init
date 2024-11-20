;; .emacs.d/init.el

;; ===================================
;; MELPA Package Support
;; ===================================
;; Enables basic packaging support
(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
     '("melpa" . "http://melpa.org/packages/") t)

;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

(use-package better-defaults
  :ensure t
  :config
  (load-theme 'material t))

(use-package material-theme
  :ensure t
  :config
  (display-line-numbers-mode t))

(use-package company
  :ensure t
  :config
  (add-to-list 'company-backends 'company-capf)
  (global-company-mode))

(use-package lsp-mode
  :ensure t
  :hook
  (python-mode . lsp)
  :commands lsp)

(use-package tex
  :ensure auctex)

(use-package python-black
  :demand t
  :after python
  :hook (python-mode . python-black-on-save-mode-enable-dwim))

(use-package pyvenv
  :ensure t
  :config
  (pyvenv-mode 1))

(use-package anaconda-mode
  :ensure t
  :bind (("C-c C-x" . next-error))
  :config
  (require 'pyvenv)
  (add-hook 'python-mode-hook 'anaconda-mode))

;; (use-package company-anaconda
;;   :ensure t
;;   :config
;;   (eval-after-load "company"
;;    '(add-to-list 'company-backends '(company-anaconda :with company-capf))))

(use-package highlight-indent-guides
  :ensure t
  :config
  (add-hook 'python-mode-hook 'highlight-indent-guides-mode)
  (setq highlight-indent-guides-method 'character))

(use-package move-text
  :ensure t
  :config)

(move-text-default-bindings)

;; ===================================
;; Basic Customization
;; ===================================

; (loadq-theme 'material t)            ;; Load material theme
; (display-line-numbers-mode t)       ;; Enable line numbers globally
(add-hook 'clojure-mode-hook 'linum-mode)

(tool-bar-mode -1) ;; hide tool bar
(menu-bar-mode -1) ;; hide menu bar

(latex-preview-pane-enable)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4) ;; tab width indentation
(setq inhibit-startup-message t)    ;; Hide the startup message
(setq indent-line-function 'insert-tab)
(setq doc-view-continuous t) ;; continuous pdf scrolling

(global-auto-revert-mode t)


;; User-Defined init.el ends here

