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
