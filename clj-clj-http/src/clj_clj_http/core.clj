(ns clj-clj-http.core)

(require '[clj-http.client :as client])

(let [response (client/get "http://example.com/")]
  (println (response :status))
  (println (keys response))
  (println (response :headers))
  (println ((response :headers) :cache-control)))
