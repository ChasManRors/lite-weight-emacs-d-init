;;    ================ ** FUNCTIONS ** ================

;;    FUNCTION to insert date in buffer
(defun insert-date () "Insert according to locale's date and time format." (interactive)
  (insert (format-time-string "%c" (current-time))))


;;    FUNCTION Simple code fold toggling, makes indenting more meaningful
;;    See: http://emacs.wordpress.com/2007/01/16/quick-and-dirty-code-folding/
(defun jao-selective-display ()
  "Activate selective display based on the column at point"
  (interactive)
  (set-selective-display
   (if selective-display
       nil
     (+ 1 (current-column)))))
;;    C-C C-space
(global-set-key [3 67108896] (quote jao-selective-display))


;;    FUNCTION http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html
(defun xah-open-in-external-app (&optional file)
  "Open the current file or dired marked files in external app.
The app is chosen from your OS's preference."
  (interactive)
  (let ( doIt
         (myFileList
          (cond
           ((string-equal major-mode "dired-mode") (dired-get-marked-files))
           ((not file) (list (buffer-file-name)))
           (file (list file)))))
    (setq doIt (if (<= (length myFileList) 5)
                   t
                 (y-or-n-p "Open more than 5 files? ") ) )
    (when doIt
      (cond
       ((string-equal system-type "windows-nt")
        (mapc (lambda (fPath) (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" fPath t t)) ) myFileList))
       ((string-equal system-type "darwin")
        (mapc (lambda (fPath) (shell-command (format "open \"%s\"" fPath)) )  myFileList) )
       ((string-equal system-type "gnu/linux")
        (mapc (lambda (fPath) (let ((process-connection-type nil)) (start-process "" nil "xdg-open" fPath)) ) myFileList) ) ) ) ) )


;;    FUNCTION http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html
(defun xah-open-in-desktop ()
  "Show current file in desktop (OS's file manager)."
  (interactive)
  (cond
   ((string-equal system-type "windows-nt")
    (w32-shell-execute "explore" (replace-regexp-in-string "/" "\\" default-directory t t)))
   ((string-equal system-type "darwin") (shell-command "open ."))
   ((string-equal system-type "gnu/linux")
    (let ((process-connection-type nil)) (start-process "" nil "xdg-open" "."))
    ;; (shell-command "xdg-open .") ;; 2013-02-10 this sometimes froze emacs till the folder is closed. ⁖ with nautilus
    ) ))


;; (require 'ansi-color)
;; (defun cma-color-log (args)
;;   "docstring"
;;   (interactive "P")
;;   (ansi-color-apply-on-region (point-min) (point-max))
;;   (replace-string "" "" nil (point-min) (point-max) nil)
;;   (replace-string "" "" nil (point-min) (point-max) nil)
;;   (replace-string "" "" nil (point-min) (point-max) nil)
;;   )


;;  Much faster solution to colorize from controll characters
(require 'ansi-color)
(defun my-colorize-buffer-window (win)
  (ansi-color-apply-on-region (window-start win) (window-end win t)))
(defun my-colorize-buffer (win _start)
    (mapc #'my-colorize-buffer-window (get-buffer-window-list (window-buffer win) nil 'visible)))
(add-hook 'window-scroll-functions 'my-colorize-buffer)


(defun cma-clean-slack (args)
  "docstring"
  (interactive "P")
  (replace-regexp "^\\[.*\\]$" "" nil (point-min) (point-max) nil)
  (replace-string "(edited)" "" nil (point-min) (point-max) nil)
)

;;; put files with linenumber in a buffer and run this function with cursor on line
(defun jump-to-file-and-line ()
  "Reads a line in the form FILENAME:LINE and, assuming a
relative path, opens that file in another window and jumps to the
line."
  (interactive)
  (let ((line (buffer-substring-no-properties (point-at-bol) (point-at-eol))))
    (string-match "\\(.*\\):\\([0-9]+\\)" line)
    (let ((file (match-string 1 line))
          (lnum (match-string 2 line)))
      (when (and file (file-exists-p (concat default-directory file)))
        (find-file-other-window (concat default-directory file))
        (and lnum (goto-line (string-to-number lnum))))
      (linum-mode))))

(defun show-file-name ()
  "Show the full path file name and set mark"
  (interactive)
  (push-mark (point))
  (insert (message (buffer-file-name))))
