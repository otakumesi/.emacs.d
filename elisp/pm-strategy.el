(defclass pm-strategy ()
  ((name nil)))

(defmethod init-package ()
  (warn "This class is interface. Please, Use the strategy inherited this class." ()))

(defclass pm-package-strategy (pm-strategy)
  ((name 'package)))

(defclass pm-el-get-strategy (pm-strategy)
  ((name 'el-get)))

(defmethod init-package ((pm pm-package-strategy))
  (package-initialize))

(defmethod init-package ((pm pm-el-get-strategy))
  (unless (require 'el-get nil 'noerror)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
      (goto-char (point-max))
      (eval-print-last-sexp))))

(setf *pm (make-instance 'pm-strategy))
(init-package *pm)
