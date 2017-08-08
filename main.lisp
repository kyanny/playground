(+ 1 1)

(ql:system-apropos "json")

(ql:quickload "cl-json")

(let
    ((x (cl-json:decode-json-from-string "{\"foo\":1}")))
  (print (length x)))


(ql:system-apropos "excel")
(ql:system-apropos "github")

(ql:quickload "cl-github-v3")

(with-open-file (in "example.json")
  (loop for line = (read-line in nil)
        while line
        do (write-line line)))


(let*
    ((string (alexandria:read-file-into-string
              "example.json"))
     (json (cl-json:decode-json-from-string string)))
  (first (first (json))))

(cl-json:decode-json-from-string
 (alexandria:read-file-into-string "example.json"))

(setq a 1)

a

(setq data (alexandria:read-file-into-string "example.json"))

data

(setq json (cl-json:decode-json-from-string data))

json

(json :glossary)

(assoc json :glossary)

json
(size json)

(length json)

(first json)

(assoc (first json) :GLOSSARY)


(check-type json)

(assoc :glossary json)
(cons (assoc :glossary json))

'(1 . 2)

(assoc 1 '(1 . 2))

(let
    ((alist '((a . 1) (b . 2))))
  (length alist))


(setq alist '((:key . :val)))

(assoc :key alist)
(first (assoc :key alist))
(rest (assoc :key alist))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; https://learnxinyminutes.com/docs/common-lisp/

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 0. Syntax
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


10
:THING

t

(+ 1 2 3 4)

'(4 :foo t)


#|

foo bar baz

|#


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 1. Primitive Datatypes and Operators
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


'foo

(intern "AAAA")
(intern "AAAA")
(eq 'aaaa (intern "AAAA"))

(intern "aaa")

9999999999999999999999
#b111
#o111
#x111

3.14159s0
3.14159d0
1/2
#C(1 2)                                 ; doesn't work

'(+ 1 2)

(funcall #'+ 1 2 3)

(+ 1 1)
(- 8 1)
(* 10 2)
(expt 2 3)
(mod 5 2)
(/ 35 5)
(/ 1 3)
(+ #C(1 2) #C(6 -4))

t
nil
(not nil)
(and 0 t)
(or 0 nil)

#\A
#\λ
#\u03BB

"Hello, World!"
"Benjamin \"foo\" bar"

(concatenate 'string "hello" "world")

(elt "Apple" 0)

(format nil "~a can be ~a" "strings" "formatted")
(format t "Common Lisp is groovy. Dude.~%")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. Variables
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *some-var* 5)
*some-var*

(defparameter *AあB* t)
*AあB*

*foobarbaz*

(let ((me "dance with you"))
  me)

me

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. Structs and Collections
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defstruct dog name breed age)
(defparameter *rover*
  (make-dog :name "rover"
            :breed "collie"
            :age 5))
*rover*

(dog-p *rover*)
(dog-name *rover*)
(defstruct cat)
(cat-p 1)
(cat-name nil)
(dog-foo *rover*)

(cons 'SUBJECT 'VERB)
(car (cons 'SUBJECT 'VERB))
(cdr (cons 'SUBJECT 'VERB))

(cons 1 (cons 2 (cons 3 nil)))
(list 1 2 3)
'(1 2 3)
(quote (1 2 3))

(cons 4 '(1 2 3))

(append '(1 2) '(3 4))

(concatenate 'list '(1 2) '(3 4))

(mapcar #'1+ '(1 2 3))
(mapcar (lambda (n) (1+ n)) '(1 2 3))
(mapcar #'+ '(1 2 3) '(10 20 30))
(mapcar (lambda (n m) (+ n m)) '(1 2 3) '(10 20 30))
(remove-if-not #'evenp '(1 2 3 4))
(remove-if-not (lambda (n) (evenp n)) '(1 2 3 4))
(every #'evenp '(1 2 3 4))
(every (lambda (n) (evenp n)) '(1 2 3 4))
(every #'evenp '(2 4 6 8))
(some #'oddp '(1 2 3 4))
(some (lambda (n) (oddp n)) '(1 2 3 4))
(some (lambda (n) (oddp n)) '(2 2 2 2))
(butlast '(subject verb object))
(butlast '(subject verb object) 0)
(butlast '(subject verb object) 1)
(butlast '(subject verb object) 2)
(butlast '(subject verb object) 3)
(butlast '(subject verb object) 4)
