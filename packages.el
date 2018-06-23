;;; packages.el --- epitech layer packages file for Spacemacs.
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

(defconst epitech-packages
      '(
        (epitech-c-style :location local)
        ))

(defun epitech/init-epitech-c-style ()
  (use-package epitech-c-style
    :if (or 'epitech-enable-c-style)
    :config (progn
              (when epitech-enable-c-style (add-hook 'c-mode-common-hook 'epitech-set-c-style))))
  )

;;; packages.el ends here
