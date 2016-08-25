(ns clj.core
  (:require [clj-http.client as :http])
  (:require [clojure.data.json :as json]))

(http/get)

(defn foo
  "I don't do a whole lot."
  [x]
  (println x "Hello, World!"))

(foo "Men")

(require '[clj-http.client :as client])

(ns my-app.core
  (:require [clj-http.client :as client]))

(hiccup)
(:require )

(print (clj-http.client/get "http://example.com"))

(use 'hiccup.core)

(html [:head] [:body])

(hiccup.core/html [:head])

(hiccup.page/html5)

(use 'hiccup/page)

([:foo 1] :foo)

{:a 1 :b 2}

({:a 1 :b 2} :b)


((clj-http.client/get "http://example.com") :status)
(keys (clj-http.client/get "http://example.com"))
((clj-http.client/get "http://example.com") :headers)

(doseq [x ((clj-http.client/get "http://example.com") :headers)]
  (print x))
  
(let [headers ((clj-http.client/get "http://example.com") :headers)]
  (prn headers))

(def headers ((clj-http.client/get "http://example.com") :headers))

headers

(let (first headers))

(let [header (first headers)]
  (let [key (first header) val (second header)]
    (prn (str key "=" val))))


(let [headers ((clj-http.client/get "http://example.com") :headers)]
  (doseq [header headers]
    (let [key (first header) val (last header)]
      (prn (str key "=" val)))))

([clj-http.client/get "http://tech.pepabo.com/2015/11/17/pepabo-tech-blog-has-started/"])

(prn 1)



(require '[clojure.string :as str])

(clojure.string/split "foo:bar:baz" #":")

(count (str/split "release1:" #":"))
(count '(1 2 3))

(count [1 2 3])


