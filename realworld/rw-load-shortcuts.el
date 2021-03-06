;;
;; Load shortcuts. Default keybinding F2-H
;;

(require 'gis)
(require 'rw-custom-group)

(defcustom rw-file-with-shortcuts "magik/shortcuts.magik"
  "The name of the file with shortcuts"
  :group 'rw-custom-group
  :type  'file)

(defun rw-load-shortcuts ()
  "Loads magik/shortcuts.magik"
  (interactive)
  (let*
      (
       (l-path (expand-file-name (concat rw-site-lisp-dir rw-file-with-shortcuts)))
       (l-cmd (concat "load_file(\"" l-path "\")\n"))
       )
    ;;(message l-path)
    (if (not (file-exists-p l-path))
	(error (concat "File not found: " l-path))
      (progn 
	(message (concat "Loading " l-path))
	(goto-char (point-max))
	(send-string gis-process l-cmd)
	)
      )
    )
  )

(provide 'rw-load-shortcuts)
