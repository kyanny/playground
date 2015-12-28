(ns clj-data.csv)

(require '[clojure.data.csv :as csv])

(doseq [row (csv/read-csv (slurp "usa-states.csv"))]
  (prn (str (first row) " => " (second row))))

(map
 (fn [row] (str (first row) " => " (second row)))
 (csv/read-csv (slurp "usa-states.csv")))
