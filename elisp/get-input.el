(defun get-stdin ()
(let ((buf (generate-new-buffer "buf")))
    (set-buffer buf)
    (condition-case nil
        (let ((line))
          (while (setq line (read-string ""))
            (insert line "\n")))
      (error nil))
     (buffer-string)))
