;;;###autoload
(defconst epitech-c-style
  `("linux"
    (c-basic-offset . 4)
    (tab-width . 4)
    (indent-tabs-mode . nil))
  "Epitech C/C++ Programming Style")

;;;###autoload
(defun epitech-set-c-style ()
  "Set the current buffer's c-style to Epitech C/C++ Programming
  Style. Meant to be added to `c-mode-common-hook'."
  (c-add-style "Epitech" epitech-c-style t))

(provide 'epitech-c-style)
