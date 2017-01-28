;(setq c-default-style "stroustrup")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(agda2-fontset-name nil) ;; coerce agda to use the default emacs font
 )

(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(defun ensure-package-installed (&rest packages)
  (mapcar
   (lambda (package)
     (unless (package-installed-p package)
       (package-install package)))
   packages))

;make sure to have downloaded archive description.
;Or use package-archive-contents as suggested by Nicolas Dudebout
(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(ensure-package-installed
 'haskell-mode
 'markdown-mode
 )

;enable highlighting for certain filetypes within certain modes
(setq auto-mode-alist
      (append
       '(("\\.cu$" . c++-mode))
       '(("CMakeLists\\.txt$" . cmake-mode))
       '(("\\.cmake$" . cmake-mode))
       auto-mode-alist))

(autoload 'cmake-mode "/usr/share/emacs/site-lisp/cmake-mode.el" t)

;backup files to system's temporary directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;load agda
(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
