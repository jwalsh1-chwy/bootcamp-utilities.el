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

(quote 
 (print (sanitize-string-for-filename "Introduction to Information Retrieval"))

 (sanitize-string-for-filename-and-copy "Introduction to Information Retrieval")
 )


 
