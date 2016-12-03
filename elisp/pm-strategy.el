(defclass pm-strategy ()
  ;; This classs is package manger strategy interface.
  ((name :initarg :name
         :initform nil
         :type symbol)))

(cl-defgeneric init-package ((pm-strategy)))

(cl-defmethod init-package ((pm pm-strategy))
  (warn "The pm-strategy is interface.  Please, Use the strategy inherited this class.  "))

(defclass pm-package-strategy (pm-strategy)
  ((name 'package)))

(defclass pm-el-get-strategy (pm-strategy)
  ((name 'el-get)))

(cl-defmethod init-package ((pm pm-package-strategy))
  (package-initialize))

(cl-defmethod init-package ((pm pm-el-get-strategy))
  (unless (require 'el-get nil 'noerror)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
      (goto-char (point-max))
      (eval-print-last-sexp))))

(defvar *pm)
(setf *pm (make-instance 'pm-el-get-strategy :name 'el-get))
(init-package *pm)
