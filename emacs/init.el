;; Make all commands of the “package” module present.
(require 'package)

;; Speef up start up by not loading any packages at startup.
;; (setq package-enable-at-startup nil)
;; Look at the *Messages* buffer before setting this to nil, then after.

;; Internet repositories for new packages.
(setq package-archives '(("org"       . "https://orgmode.org/elpa/")
                         ("gnu"       . "https://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ;; Maintainer is AWOL.
                         ;; ("marmalade" . "https://marmalade-repo.org/packages/")
                         ))
;; set PATH
(add-to-list 'exec-path "/usr/local/bin")
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "/bin/zsh --login -i -c 'echo $PATH'"))))
(setenv "PATH" path-from-shell)
(setq eshell-path-env path-from-shell) ; for eshell users
(setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

;; Actually get “package” to work.
(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)
;; auto-package-update
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;COMMON packages
;https://github.com/technomancy/better-defaults
(use-package better-defaults)
(use-package json-mode)
(use-package flycheck)
(global-flycheck-mode)

(use-package git-gutter
  :config
  (progn
    (custom-set-variables
     '(git-gutter:modified-sign "☁")
     '(git-gutter:added-sign "☀")
     '(git-gutter:deleted-sign "☂")
     '(git-gutter:update-interval 2))
   ))

; auto-complete https://company-mode.github.io/
(use-package company 
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))
(use-package company-lsp 
  :commands company-lsp)
(use-package lsp-mode)
(require 'lsp-mode)
(use-package lsp-ui 
  :commands lsp-ui-mode
  :init)
(use-package helm-lsp 
  :commands helm-lsp-workspace-symbol)

; highlight-parentheses
(use-package highlight-parentheses)
; vim mode
(use-package evil)
(require 'evil)
(evil-mode t)

; easy-motion for emacs
(use-package avy)
; 
(use-package paredit)
; git
(use-package magit)
(use-package evil-magit)
(require 'evil-magit)
(use-package markdown-mode)

;; Project and files explore
;; http://tuhdo.github.io/helm-projectile.html#sec-1-1
; projectile
(use-package helm)
(require 'helm-config)
(use-package projectile)
(require 'helm-projectile)
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action 'helm-projectile)
;(setq projectile-enable-caching t)

; helm-projectile
(use-package helm-projectile)

;; Theme
; gruvbox-theme
(use-package gruvbox-theme)
(enable-paredit-mode)
(load-theme 'gruvbox t)

;; Clojure
(use-package clojure-mode)
(use-package cider)
;; nREPL customizations
(setq cider-show-error-buffer 'only-in-repl)
(setq nrepl-hide-special-buffers t)     ; Don't show buffers like connection or server
(setq nrepl-popup-on-error nil)         ; Don't popup new buffer for errors (show in nrepl buffer)
(setq nrepl-popup-stacktraces-in-repl t); Display stacktrace inline
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)          ; Enable eldoc - shows fn argument list in echo area
(add-hook 'nrepl-mode-hook 'paredit-mode)                                  ; Use paredit in *nrepl* buffer


;; Go
(use-package go-mode)
(add-hook 'go-mode-hook 'lsp-deferred)
(setq lsp-gopls-staticcheck t)
(setq lsp-eldoc-render-all t)
(setq lsp-gopls-complete-unimported t)

;; UI Config
; hide menu
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;hide welcome screen
(setq inhibit-startup-screen t)
; show line number
(global-display-line-numbers-mode t)
;(setq display-line-numbers "%4d \u2502 ")
(global-git-gutter-mode t)

;(global-visual-line-mode 1)
(helm-mode 1)
(helm-projectile-on)
(projectile-mode 1)
(projectile-global-mode 1)
(global-highlight-parentheses-mode 1)
(global-company-mode t)
(electric-pair-mode 1)

;; Key Mappings
(use-package key-chord)
(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global ",s" 'save-buffer)
(key-chord-define-global ",b" 'helm-mini)
(key-chord-define-global ",f" 'helm-projectile-find-file)
(key-chord-define-global ",e" 'dired-jump)
(key-chord-define-global "((" 'paredit-wrap-round)
;; Max time delay between two key presses to be considered a key chord
(setq key-chord-two-keys-delay 0.2) ; default 0.1
    
;; Max time delay between two presses of the same key to be considered a key chord.
;; Should normally be a little longer than `key-chord-two-keys-delay'.
(setq key-chord-one-key-delay 0.3) ; default 0.2

(defun myprevious-window ()
    (interactive)
    (other-window -1))

(global-set-key (kbd "s-/") 'comment-or-uncomment-region)
(global-set-key (kbd "s-b") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;https://www.reddit.com/r/emacs/comments/67rlfr/esc_vs_cg/
(define-key key-translation-map (kbd "ESC") (kbd "C-g"))

(evil-define-minor-mode-key 'normal 'cider-popup-buffer-mode
                           "q" 'cider-popup-buffer-quit-function)

;https://evil.readthedocs.io/en/latest/keymaps.html#evil-define-key
(evil-define-key '(normal emacs) global-map
  "f" 'avy-goto-char-2
  "ww" 'other-window
  "WW" 'myprevious-window
;  "q" 'cider-popup-buffer-quit-function
   )
; (evil-define-key nil cider-popup-buffer-mode-map
;   "C-x q" 'helm-mini)

; (define-key  cider-popup-buffer-mode-map (kbd "q") 'helm-mini)

; (add-hook 'cider-popup-buffer-mode-hook
;           '(lambda ()
;                 (evil-define-key nil global-map
;                   "q" nil)
;                 (evil-define-key nil cider-popup-buffer-mode-map
;                   "C-x q" 'helm-mini)
;            ))


;(evil-ex-define-cmd "Exp[lore]" 'dired-jump)
;(evil-ex-define-cmd "color[scheme]" 'customize-themes)

;;put all of the auto-save and backup files in /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; NOTICE
; this config is not apply for all user, change it on your own
(setq projectile-project-search-path '("~/projects/" "~/mprojects"))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "76c5b2592c62f6b48923c00f97f74bcb7ddb741618283bdb2be35f3c0e1030e3" "aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" default)))
 '(git-gutter:added-sign "☀")
 '(git-gutter:deleted-sign "☂")
 '(git-gutter:modified-sign "☁")
 '(git-gutter:update-interval 2)
 '(package-selected-packages
   (quote
    (color-theme-sanityinc-tomorrow paredit git-gutter zenburn-theme json-mode lsp-mode company markdown-mode go-mode gruvbox-theme evil helm better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#282828" :foreground "#fdf4c1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 145 :width normal :foundry "nil" :family "Monaco")))))
