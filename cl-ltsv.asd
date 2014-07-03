#|
  This file is a part of cl-ltsv project.
  Copyright (c) 2013 Takayuki Sato (takayuki.sato.dev@gmail.com)
|#

#|
  Author: Takayuki Sato (takayuki.sato.dev@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-ltsv-asd
  (:use :cl :asdf))
(in-package :cl-ltsv-asd)

(defsystem cl-ltsv
  :version "0.2.0"
  :author "Takayuki Sato"
  :license "LLGPL"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "cl-ltsv"))))
  :description "LTSV parser for common lisp."
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.md"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (load-op cl-ltsv-test))))
