;;; bootcamp-utilities.el --- Bootcamp utilities

;; Copyright (C) 2023 Jason Walsh 

;; Author: Jason Walsh <jwalsh1@chewy.com> 
;; Keywords: text munging, directory setup, filename setup, bootcamps
;; URL: https://github.com/jwalsh1-chwy/bootcamp-utilities.el

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Simplify some of the standard text munging operations when setting
;; up directories and filenames for bootcamps, training sessions, and
;; tutorials.

;;

;;; Code:


(defun sanitize-string-for-filename (string)
  "Convert a title into something appropriate as a filename."
  (let ((s (downcase string)))
    (setq s (replace-regexp-in-string "[^[:alnum]]" "" s))
    (setq s (replace-regexp-in-string " " "_" s))
    s))


(defun sanitize-string-for-filename-and-copy (string)
  "Sanitizes a string and puts it on the kill ring."
  (let ((s (sanitize-string-for-filename string)))
    (kill-new s)
    (message "Sanitized string '%s' copied to the kill ring." s)))


(require 'ert)

(ert-deftest test-sanitize-string-for-filename ()
  "Tests for `sanitize-string-for-filename` function."
  (should (equal (sanitize-string-for-filename "Introduction to Information Retrieval") "introduction_to_information_retrieval"))
  (should (equal (sanitize-string-for-filename "Hello World") "hello_world"))
  (should (equal (sanitize-string-for-filename "123Hello World456") "123hello_world456"))
  ;;   (should (equal (sanitize-string-for-filename "!@#$%^&*()_+-=[]{};':\"<>,.?/|\\") "")))
  ;;   (should (equal (sanitize-string-for-filename " ") "_"))
  (should (equal (sanitize-string-for-filename " ") "_")))
  


;;; bootcamp-utilities.el ends here
 
