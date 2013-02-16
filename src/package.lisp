#|
  This file is a part of cl-ltsv project.
  Copyright (c) 2013 Takayuki Sato
|#

(in-package :cl-user)
(defpackage cl-ltsv
  (:use :cl)
  (:export
   #:parse-line
   #:with-ltsv-from-stream
   #:alist-ltsv
   ))
