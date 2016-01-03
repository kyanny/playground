(ns clj-with-in-str.core)

(read-line)

(with-in-str "Hello world"
  (read-line))

(with-in-str "Hello world"
  (slurp *in*))
