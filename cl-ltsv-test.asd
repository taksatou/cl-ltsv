#|
  This file is a part of cl-ltsv project.
  Copyright (c) 2013 Takayuki Sato (takayuki.sato.dev@gmail.com)
|#

(in-package :cl-user)
(defpackage cl-ltsv-test-asd
  (:use :cl :asdf))
(in-package :cl-ltsv-test-asd)

(defsystem cl-ltsv-test
  :author "Takayuki Sato"
  :license "LLGPL"
  :depends-on (:cl-ltsv
               :cl-test-more)
  :components ((:module "t"
                :components
                ((:file "cl-ltsv"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
