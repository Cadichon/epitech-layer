;;; funcs.el --- epitech layer funcs file for Spacemacs.
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

(setq header-epitech		"EPITECH PROJECT, "
      header-description	"File description:")

(setq std-c-alist               '( (cs . "/*") (cc . "** ") (ce . "*/") )
      std-css-alist             '( (cs . "/*") (cc . "** ") (ce . "*/") )
      std-cpp-alist             '( (cs . "/*") (cc . "** ") (ce . "*/") )
      std-pov-alist             '( (cs . "//") (cc . "// ") (ce . "//") )
      std-java-alist            '( (cs . "//") (cc . "// ") (ce . "//") )
      std-latex-alist           '( (cs . "%%") (cc . "%% ") (ce . "%%") )
      std-lisp-alist            '( (cs . ";;") (cc . ";; ") (ce . ";;") )
      std-xdefault-alist        '( (cs . "!!") (cc . "!! ") (ce . "!!") )
      std-pascal-alist          '( (cs . "{ ") (cc . "   ") (ce . "}" ) )
      std-makefile-alist        '( (cs . "##") (cc . "## ") (ce . "##") )
      std-text-alist            '( (cs . "##") (cc . "## ") (ce . "##") )
      std-fundamental-alist     '( (cs . "  ") (cc . "   ") (ce . "  ") )
      std-html-alist            '( (cs . "<!--") (cc . "  -- ") (ce . "-->"))
      std-php-alist             '( (cs . "#!/usr/local/bin/php\n<?php") (cc . "// ")(ce . "//"))
      std-nroff-alist           '( (cs . "\\\"") (cc . "\\\" ") (ce . "\\\""))
      std-sscript-alist         '( (cs . "#!/bin/sh")  (cc . "## ") (ce . "##"))
      std-perl-alist            '( (cs . "#!/usr/local/bin/perl -w")  (cc . "## ")(ce . "##"))
      std-cperl-alist           '( (cs . "#!/usr/local/bin/perl -w")  (cc . "## ")(ce . "##"))
      )

(setq std-modes-alist '(("C"                    . std-c-alist)
                        ("C/l"                  . std-c-alist)
                        ("CSS"                  . std-c-alist)
                        ("PoV"                  . std-pov-alist)
                        ("C++"                  . std-cpp-alist)
                        ("C++/l"                . std-cpp-alist)
                        ("Lisp"                 . std-lisp-alist)
                        ("Lisp Interaction"     . std-lisp-alist)
                        ("Emacs-Lisp"           . std-lisp-alist)
                        ("Fundamental"          . std-fundamental-alist)
                        ("Shell-script"         . std-sscript-alist)
                        ("Makefile"             . std-makefile-alist)
                        ("BSDmakefile"          . std-makefile-alist)
                        ("GNUmakefile"          . std-makefile-alist)
                        ("Perl"                 . std-cperl-alist)
                        ("CPerl"                . std-cperl-alist)
                        ("xdefault"             . std-xdefault-alist)
                        ("java"                 . std-java-alist)
                        ("latex"                . std-latex-alist)
                        ("Pascal"               . stdp-ascal-alist)
                        ("Text"                 . std-text-alist)
                        ("HTML"                 . std-html-alist)
                        ("PHP"                  . std-php-alist)
                        ("Nroff"                . std-nroff-alist)
                        ("TeX"                  . std-latex-alist)
                        ("LaTeX"                . std-latex-alist))
      )

(defun epitech-std-get (a)
  (interactive)
  (cdr (assoc a (eval (cdr (assoc mode-name std-modes-alist)))))
  )

(defun epitech-std-file-header ()
  "Puts a standard header at the beginning of the file.\n(According to mode)"
  (interactive)
  (goto-char (point-min))
  (let ((projname "toto")(projdescription "tiuti"))
    (setq projname (read-from-minibuffer
		    (format "Type project name (RETURN to quit) : ")))
    (setq projdescription (read-from-minibuffer
			   (format "Type short file description (RETURN to quit) : ")))

    (insert (epitech-std-get 'cs))
    (newline)
    (insert (concat (epitech-std-get 'cc)
			   header-epitech
			   (format-time-string "%Y")))
    (newline)
    (insert (concat (epitech-std-get 'cc)
			   projname))
    (newline)
    (insert (concat (epitech-std-get 'cc)
			   header-description))
    (newline)
    (insert (concat (epitech-std-get 'cc)
			   projdescription))
    (newline)
    (insert (epitech-std-get 'ce))
    (newline)
    (newline)))

(defun epitech-insert-std-vertical-comments ()
  "Inserts vertical comments (according to mode)."
  (interactive)
  (beginning-of-line)
  (insert (epitech-std-get 'cs))
  (newline)
  (let ((ok t)(comment ""))
    (while ok
      (setq comment (read-from-minibuffer
		     (format "Type comment (RETURN to quit) : ")))
      (if (= 0 (length comment))
	  (setq ok nil)
	(progn
	  (insert (concat (epitech-std-get 'cc) comment))
	  (newline)))))
  (insert (epitech-std-get 'ce))
  (newline))

(defun epitech-std-toggle-comment ()
  "Toggles line comment on or off (according to mode)."
  (interactive)
  (save-excursion
    (let (beg end)
      (beginning-of-line)
      (setq beg (point))
      (end-of-line)
      (setq end (point))
      (save-restriction
	(if (not (equal beg end))
	    (progn
	      (narrow-to-region beg end)
	      (goto-char beg)
	      (if (search-forward (epitech-std-get 'cs) end t)
		  (progn
		    (beginning-of-line)
		    (replace-string (epitech-std-get 'cs) "")
		    (replace-string (epitech-std-get 'ce) ""))
		(progn
		  (beginning-of-line)
		  (insert (epitech-std-get 'cs))
		  (end-of-line)
		  (insert (epitech-std-get 'ce))))))))) 
  ;;  (indent-according-to-mode)
  (indent-for-tab-command)
  (next-line 1))
