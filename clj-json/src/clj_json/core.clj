(ns clj-json.core)

(defn foo
  "I don't do a whole lot."
  [x]
  (println x "Hello, World!"))

(:require '[clojure.data.json :as json])

(clojure.data.json/write-str {:a 1 :b 2})
(json/write-str {:a 1 :b 2})

(ns example
  (:require [clojure.data.json :as json])
  (:require [clojure.pprint]))

(json/write-str {:a 1 :b 2})

(loaded-libs)

(json/read-str "{\"a\":1}")

(json/write [1 2 3 ] *out*)


(slurp "http://localhost:9292/")
(json/read-str (slurp "http://localhost:9292/"))

(let [data (json/read-str (slurp "http://localhost:9292/")
                          :key-fn keyword)]
  (prn data)
  (keys data)
  (data :address)
  ((data :address) :city)
  (get data :address))

(def json (slurp "http://b.hatena.ne.jp/entry/json/http://clojure.org/"))
(spit "sample.json" (slurp "http://b.hatena.ne.jp/entry/json/http://clojure.org/"))
(slurp "sample.json")

(print json)
(json/read-str json
               :key-fn keyword)

(def data (json/read-str json
                         :key-fn keyword))

data
(:require 'clojure.pprint)

(clojure.pprint/pprint data)
(count (data :bookmarks))
(data :count)
(doseq [bookmark (data :bookmarks)]
  (prn bookmark))

(doseq [bookmark (data :bookmarks)]
  (prn (str (get bookmark :tags))))

(:require 'clojure.string)

(clojure.string/join ", " ["a" "b"])

(doseq [bookmark (reverse (data :bookmarks))]
  (println
   (clojure.string/join " "
                         (list
                          "-"
                          (get bookmark :user)
                          (str "[" (clojure.string/join ", " (get bookmark :tags)) "]")
                          (get bookmark :comment))))))

(list 1 2 3)
(seq (list 1 2 3))

(select even? )

(filter (fn [n] (even? n)) [1 2 3 4 5])
(filter #(even? %) [1 2 3 4 5])

(filter #(= (get % :user) "_a666666") (data :bookmarks))

(prn hoge)

(def hoge "fuga")
