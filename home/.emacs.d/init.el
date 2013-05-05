;;; General
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)



;;; Scroll
(setq scroll-conservatively 1)
(setq scroll-step 1)
(setq scroll-margin 5)
(setq next-screen-context-lines 1)



;;; Mode Line
(line-number-mode t)
(column-number-mode t)



;;; Indent
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(add-hook 'python-mode-hook
          (lambda ()
            (tab-width 4)))



;;; Paren
(setq show-paren-delay 0)
(show-paren-mode t)



;;; Backup
(add-to-list 'backup-directory-alist
      (cons "." "~/.emacs.d/backups/") t)
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))



;;;
(cond
 ((eq system-type 'darwin)
  (require 'ucs-normalize)
  (setq file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))

 ((eq system-type 'linux)
  1))



;;; Key Bindings
(keyboard-translate ?\C-h ?\C-?)
(global-set-key (kbd "C-x ?") 'help-command)

(global-set-key (kbd "C-@") 'ESC-prefix)

(global-set-key (kbd "C-t") 'other-window)



;;; Packages
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(add-hook 'clojure-mode-hook 'paredit-mode)


;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(setq ac-delay 0)
(setq ac-auto-show-menu 0)
(setq ac-use-fuzzy t)
