;;; The function that is related to creating a database filled with contacts,
;;; @author Shinya Saito 
;;; @assignment ICS 313 HOMEWORK 1
;;; @date September 11, 2021 


;;; global variable for db 
(defvar *db* nil)

;;; make contact function 

(defun make-contact (first-name last-name address phone-number)
  (list :first-name first-name :last-name last-name :address address :phone-number phone-number))

;;; function that adds contact

(defun add-contact(contact) (push contact *db*))

;;; a function to dump the db 

(defun dump-db() 
  (dolist(contact *db*)
    (format t "~{~a:~10t~a~%~}~%" contact)))

;;; a function to save the db 

(defun save-db (filename)
  (with-open-file (out filename
                   :direction :output
                   :if-exists :supersede)
    (with-standard-io-syntax
      (print *db* out))))

;;; a function to load the db 

(defun load-db (filename)
        (with-open-file (in filename)
          (with-standard-io-syntax
            (setf *db* (read in)))))

;;; a function to select the user appopriate input 

(defun select (selector-fn)
  (remove-if-not selector-fn *db*))

;;; a function to where finding the match of the user input 

(defun where (&key first-name last-name address phone (ripped nil ripped-p))
  #'(lambda (contact)
      ( and
       (if first-name (equal (getf contact :first-name) first-name) t)
       (if last-name (equal (getf contact :last-name) last-name) t)
       (if address (equal (getf contact :address) address) t)
       (if phone (equal (getf contact :phone) phone) t))))

