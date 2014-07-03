#|
  This file is a part of cl-ltsv project.
  Copyright (c) 2013 Takayuki Sato (takayuki.sato.dev@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-ltsv
  (:nicknames #:ltsv)
  (:use :cl)
  (:export
   #:parse-line
   #:with-ltsv-from-stream
   #:alist-ltsv
   ))

(in-package :cl-ltsv)

(defun position-if-c (c s &key (start 0))
  (position-if #'(lambda (x) (eql x c)) s :start start))

(defun split-sequence (c s)
  (loop
     for right = (position-if-c c s) then (position-if-c c s :start (1+ right))
     and left = 0 then (1+ right)
     collect (subseq s left right)
     until (null right)))
    
(defun parse-line (s)
  (loop
     for kv in (split-sequence #\tab s)
     collect (let ((pos (position-if-c #\: kv)))
	       (if pos
		   (cons (subseq kv 0 pos)
			 (subseq kv (1+ pos)))))))

(defmacro with-ltsv-from-stream ((entry stream) &body body)
  (let ((line (gensym)))
    `(loop
        for ,line = (read-line ,stream nil :eof)
        until (eql ,line :eof)
        do (let ((,entry (parse-line ,line)))
             ,@body))))

(defun alist-ltsv (entry)
  (with-output-to-string (ss)
    (loop
       for alist in entry
       and _ = nil then (format ss "	")
       do (format ss "~A:~A" (car alist) (cdr alist)))))

       
