;;; ICS 313 Fall 2021 Homework 1
;;; Shinya Saito
;;; saitoshi@hawaii.edu

;;; a global variable
(defvar *db* nil)

;;; a function to make a contact with a firstName, lastName, adress, and a phoneNumber

(defun make-contact(first-name last-name address phone)
(list :first-name first-name :last-name last-name :address address :phone phone))

;;; a function to add a contact to the current database with a firstName, lastName, address, and a phoneNumber
(defun add-contact(contact(push contact *db*)))

;;; a function to dump-db

;;; a function to save-db

;;; a function to
