;; (require 'package)
;; (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
;;                     (not (gnutls-available-p))))
;;        (proto (if no-ssl "http" "https")))
;;   (when no-ssl
;;     (warn "\
;; Your version of Emacs does not support SSL connections,
;; which is unsafe because it allows man-in-the-middle attacks.
;; There are two things you can do about this warning:
;; 1. Install an Emacs version that does support SSL and be safe.
;; 2. Remove this warning from your init file so you won't see it again."))
;;   ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
;;   (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
;;   ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
;;   (when (< emacs-major-version 24)
;;     ;; For important compatibility libraries like cl-lib
;;     (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
;; (package-initialize)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;;    Struff I made or got from the web
(add-to-list 'load-path "~/.emacs.d/site-lisp/")

;;    (Remove the "trailing" white space)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;    Flash screen for c-g do not ring bell
(set-variable (quote visible-bell) t nil)

;;    Change line color when line is over 110 characters
(require 'whitespace)
(setq whitespace-line-column 110) ;; limit line length
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)

;;    Remove noob toolbar
(tool-bar-mode -1)

;;     Color matching parentheses
(show-paren-mode t)

;;    Show file path in Frame Title
(setq-default frame-title-format "%b (%f)")

;;    I can't stand electric-pair-mode
(wrap-region-global-mode t)
(wrap-region-add-wrapper "$" "$")
(wrap-region-add-wrapper "{-" "-}" "#")
(wrap-region-add-wrapper "/" "/" nil 'ruby-mode)
(wrap-region-add-wrapper "/* " " */" "#" '(java-mode javascript-mode css-mode))
(wrap-region-add-wrapper "`" "`" nil '(markdown-mode ruby-mode org-mode))
;;    Like wrap-region with characters
(electric-pair-mode)

;;    Make confirmations easier
(defalias 'yes-or-no-p 'y-or-n-p)

;;    enforce ruby best syntactic practices
(add-hook 'ruby-mode-hook #'rubocop-mode)

;;    Iniital font size
(set-frame-font "Menlo-16")

;;    Let emacs pick up the shell path
(exec-path-from-shell-initialize)

;;    Replace highlighted text with what I type
(delete-selection-mode 1)

;;    This is useful since I can no longer get emacsclient to work for git operations from within emacs
(setq inhibit-splash-screen t)

;;    Use ruby-mode for these type of files
(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))

;; show line cursor it on in the margin with the line numbers
(require 'hlinum)
(hlinum-activate)

;;    Don't ask me if I want to narrow just do it.
(put 'narrow-to-region 'disabled nil)

;;    allow use of <C-return> to toggle folding
(add-hook 'prog-mode-hook (lambda () (yafolding-mode)))

;;    stay in utf-8
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
; (set-locale-environment "en.UTF-8")
(prefer-coding-system 'utf-8)
;;    don't insert "# -*- coding: utf-8 -*-"
(setq ruby-insert-encoding-magic-comment nil)

;;    Make parens an brackets different colors in all modes
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;;    company ???
(global-company-mode)

;;    To have shell open in same window.
(push (cons "\\*shell\\*" display-buffer--same-window-action) display-buffer-alist)

(setq shell-file-name "bash")
(setq shell-command-switch "-ic")

;;    make cursor more visible
(set-cursor-color 'white)

(desktop-save-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(iedit treemacs yafolding rainbow-delimiters wrap-region hlinum exec-path-from-shell company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'misterioso nil nil)

(load "~/.emacs.d/site-lisp/my-functions.el")
(load "~/.emacs.d/site-lisp/my-key-bindings.el")
