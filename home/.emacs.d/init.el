;;; General
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)


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
