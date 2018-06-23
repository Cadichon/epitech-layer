;;; keybindings.el --- epitech layer keybindings file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Cadichon <leo.labruyere@pm.me>
;; URL: https://github.com/Cadichon/epitech-layer
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(global-set-key	"" 'epitech-std-file-feheader)
(global-set-key "h" 'epitech-update-std-header)
(global-set-key "" 'epitech-std-file-header)

;;; In CPerl mode, C-c C-h is used to do some help.
;;; so it is C-c C-h h
;;; For working, it requires info pages about perl
(add-hook 'cperl-mode-hook
	  '(lambda ()
	     (define-key cperl-mode-map ""
	       'comment-region)
	     (define-key cperl-mode-map "h"
	       'epitech-std-file-header)))

;; for perl-mode
(add-hook 'perl-mode-hook
	  '(lambda ()
	     (define-key perl-mode-map ""
	       'comment-region)))

;; for all kind of lisp code
(add-hook 'emacs-lisp-mode-hook
	  '(lambda ()
	     (define-key emacs-lisp-mode-map  ""
	       'comment-region)))

(add-hook 'lisp-mode-hook
	  '(lambda ()
	     (define-key lisp-mode-map  ""
	       'comment-region)))

;; for La(TeX)-mode
(add-hook 'tex-mode-hook
	  '(lambda ()
	     (define-key tex-mode-map ""
	       'comment-region)))
