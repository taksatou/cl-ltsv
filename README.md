# cl-ltsv

cl-ltsv is LTSV parser for common lisp.

http://ltsv.org/

## Installation

TODO

## Usage

```
CL-USER> (cl-ltsv:parse-line "host:127.0.0.1	ident:-	user:frank")
(("host" . "127.0.0.1") ("ident" . "-") ("user" . "frank"))

CL-USER> (with-input-from-string (ss "host:127.0.0.1	ident:-	user:frank
host:127.0.0.1	ident:-	user:jane
host:127.0.0.1	ident:-	user:john")
           (cl-ltsv:with-ltsv-from-stream (entry ss)
             (print entry)))

(("host" . "127.0.0.1") ("ident" . "-") ("user" . "frank")) 
(("host" . "127.0.0.1") ("ident" . "-") ("user" . "jane")) 
(("host" . "127.0.0.1") ("ident" . "-") ("user" . "john")) 
NIL

CL-USER> (cl-ltsv:alist-ltsv '(("host" . "127.0.0.1") ("ident" . "-") ("user" . "frank")))
"host:127.0.0.1	ident:-	user:frank"
```

## Author

* Takayuki Sato (takayuki.sato.dev@gmail.com)

## Copyright

Copyright (c) 2013 Takayuki Sato (takayuki.sato.dev@gmail.com)

# License

Licensed under the LLGPL License.

