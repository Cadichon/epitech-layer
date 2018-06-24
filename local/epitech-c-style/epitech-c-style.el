;;;###autoload
(defconst epitech-c-style
  `("linux"
    (c-basic-offset . 8)
    (tab-width . 8)
    (indent-tabs-mode . t))
  "Epitech C/C++ Programming Style")

;;;###autoload
(defun epitech-set-c-style ()
  "Set the current buffer's c-style to Epitech C/C++ Programming
  Style. Meant to be added to `c-mode-common-hook'."
  (c-add-style "Epitech" epitech-c-style t))

(provide 'epitech-c-style)
