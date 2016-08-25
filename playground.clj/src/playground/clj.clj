(ns playground.clj)

(defn foo
  "I don't do a whole lot."
  [x]
  (println x "Hello, World!"))

(require 'clostache.parser)
(clostache.parser/render "Hello, {{name}}!" {:name "kensuke"})

(require 'clojure.data.csv)

(first (first (clojure.data.csv/read-csv (slurp "hoge.csv"))))

(clojure.data.csv/read-csv (slurp "fuga.tsv"))
(count (first (clojure.data.csv/read-csv (slurp "fuga.tsv"))))
(count (first (clojure.data.csv/read-csv (slurp "fuga.tsv") :separator \tab)))

(require 'clojure-csv.core)

(clojure-csv.core/parse-csv (slurp "hoge.csv"))
(clojure-csv.core/parse-csv (slurp "fuga.tsv") :delimiter \tab)



(def f
  (future (println "start")
          (Thread/sleep 5000)
          (println "done") 110))

(println (str "result => " @f))
(deref f)
(shutdown-agents)


;; (range 1 10)

;; (count (range 1 100))

;; (doseq [n (range 1 101)]
;;   (println n))

;; (dotimes [n 10]
;;   (println n))

;; (println "\n")

;; (clojure.string/join "," (map (fn [n] (str n " Hello world!")) (range 1 10)))

;; (map (fn [x] (str "Hello " x "!")) ["world" "is" "mine"])

;; (require '[clojure.pprint :refer :all])
;; (defn pp [args] (clojure.pprint/pprint args))

;; (clojure.pprint/pprint [ 1 2 3 ])

;; (pprint [1 2 3])

;; (clojure.pprint/pprint (slurp "/etc/hosts"))
;; (clojure.pprint/pprint (clojure.string/split-lines (slurp "/etc/hosts")))

;; (filter even? (range 1 10))

;; (def hosts (slurp "/etc/hosts"))
;; (def hosts (clojure.string/split-lines hosts))
;; (def s (slurp "/etc/hosts"))

;; s

;; (def ss (clojure.string/split-lines s))
;; ss
;; (re-find #"^#" s)

;; (map (fn [s] (re-groups #"^#" s)) ss)

;; (re-find #"^#" "abc")

;; (clojure.pprint/pprint
;;  (filter (fn [s] (not (re-find #"^#" s))) ss))
