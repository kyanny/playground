(ns clj-clojure-csv.core)

(require '[clojure-csv.core :as csv])

(let [filename "usa-states.csv"
      csv (slurp filename)
      rows (csv/parse-csv csv)]
  rows)

(let [filename "usa-states.csv"
      csv (slurp filename)
      rows (csv/parse-csv csv)]
  (doseq [row rows]
    (let [code (first row)
          name (second row)]
      (println (str code " => " name)))))

(let [filename "test.ltsv"
      csv (slurp filename)
      rows (csv/parse-csv csv :delimiter \tab)]
  rows)

(let [filename "test.ltsv"
      csv (slurp filename)
      rows (csv/parse-csv csv :delimiter \tab)]
  (map (fn [row]
         (str (first row) " => " (second row)))
       rows))

(csv/write-csv [["foo" "bar"]
                ["baz" "qux"]])

(csv/write-csv [["foo" "bar"]
                ["baz" "qux"]
                ["I'm" "pen"]]
               :delimiter \tab)

(println
 (csv/write-csv [["foo" "bar"]
                 ["baz" "qux"]]
                :force-quote true))

(println
 (csv/write-csv [["foo" "bar"]
                 ["baz" "qux"]]
                :quote-char \!
                :force-quote true))

(csv/write-csv [["foo" "bar"]
                ["baz" "qux"]]
               :end-of-line \newline)
