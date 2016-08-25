(require '[clojure.string :refer [join]])

(join "," ["a" "b" "c"])
(clojure.string/join ", " [1 2 3])

(require '[clojure.data.json :as json])

(pprint {:a 1 :b 2})

(json/pprint {:a 1 :b 2})

(pprint {:a 1 :b 2 "c" 3})

(require '[clojure.test :refer :all])

(deftest test-json-equal
  (is (=
       (json/write-str {"a" 1 "b" 2})
       "{\"a\":1,\"b\":2,}"
       )))

(test-json-equal)

(defn- tmpl [title h1]
  (str "<html>
<head>
<title>" title
       "</title>
<body>
<h1>" h1
       "</h1>
</body>
</html>"))

(println (tmpl "My Page" "King!"))

;; (println "Hello Clojure")
;; (:require [clojure.data.json :as json]))

;; (defn add [x y] (+ x y))
;; (use 'clojure.test)

;; (deftest test-add
;;   (is (add 1 2) 4))

;; (test-add)

;; (is 1 2)

;; (println "hello
;; world
;; !
;; ")

;; (use 'clojure.data.json)

;; ;; (ns :main)
;; ;; (defn -main []
;; ;;   (print "Hello world"))

;; ;; (ns playground)
;; ;; (slurp "/etc/hosts")
;; ;; (slurp "http://example.com")
;; ;; (slurp "https://www.verisign.com")
;; ;; (slurp "https://api.github.com")

;; ;; *in*

;; ;; (spit "./a.out" (str "hello" "world" "!!") :append true)
;; ;; (slurp "./a.out")

;; ;; (spit "./a.out" (slurp "http://example.com"))
;; ;; (print (slurp "./a.out"))
