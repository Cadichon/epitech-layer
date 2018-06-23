;;; config.el --- epitech layer config file for Spacemacs.
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

(set-variable 'c-argdecl-indent 0)
(normal-erase-is-backspace-mode 0)

(defvar epitech-enable-c-style nil
  "If non nil `epitech-set-c-style' will be added as as
  `c-mode-common-hook'.")
