(ns clj-data.csv)

(require '[clojure.data.csv :as csv])

(let [filename "usa-states.csv"
      csv (slurp filename)
      rows (csv/read-csv csv)]
  rows)

(let [filename "usa-states.csv"
      csv (slurp filename)
      rows (csv/read-csv csv)]
  (doseq [row rows]
    (let [code (first row)
          name (second row)]
      (println (str code " => " name)))))

(let [filename "test.ltsv"
      csv (slurp filename)
      rows (csv/read-csv csv :separator \tab)]
  (map (fn [row]
         (str (first row) " => " (second row)))
       rows))

(with-out-str
  (csv/write-csv *out* [["foo" "bar"]
                        ["baz" "qux"]]))

(csv/write-csv *out* [["foo" "bar"]
                      ["baz" "qux"]
                      ["I'm" "pen"]]
               :separator \tab)
