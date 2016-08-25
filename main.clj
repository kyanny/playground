;; (re-seq #"[a-z]+" "abc1d")

;; (apply str (re-seq #"[a-z]+" "abc1d"))

;; (str "abc" "d")

;; (let [x (re-seq #"[a-z]+" "abc1d")]
;;   (= x (list "abc" "d")))

;; (str (list "abc" "d"))

;; (pr (str (list "abc" "d")))

;; (sort '( 1 3 7 5))

;; (fn [numbers] (last (sort numbers)))

;; (
;;  (fn [& numbers] (last (sort numbers)))
;;  10 20 5)


;; (reduce
;;  (fn [x y] (* x y))
;;  [1 2 3 4 5]
;;  )

;; (reduce
;;  +
;;  []
;;  )

;; (reduce
;;  (fn [x y] (+ x y))
;;  99 [1 2 3]
;;  )

;; (conj [10] 1)

;; ((fn foo [x]
;;   (when (> x 0)
;;     (conj (foo (dec x)) x))) 5)

;; (let [x 0]
;;   (when (> x 0)
;;     (conj [:a] x)))

;; x = 5
;; (conj (?) 5)

;; x = 4
;; (conj (conj (?) 4) 5)

;; x = 3
;; (conj (conj (conj (?) 3) 4) 5)

;; x = 2
;; (conj (conj (conj (conj (?) 2) 3) 4) 5)

;; x = 1
;; (conj (conj (conj (conj (conj (?) 1) 2) 3) 4) 5)

;; x = 0
;; (conj (conj (conj (conj (conj nil 1) 2) 3) 4) 5)

;; (conj nil 1) ;=> (1)
;; (conj (conj (conj (conj '(1) 2) 3) 4) 5)

;; (conj '(1) 2) ;=> (2 1)
;; (conj (conj (conj '(2 1) 3) 4) 5)

;; (conj '(2 1) 3) ;=> (3 2 1)
;; (conj (conj (3 2 1) 4) 5)

;; (conj '(3 2 1) 4) ;=> (4 3 2 1)
;; (conj '(4 3 2 1) 5)

;; '(5 4 3 2 1)


;; ((fn foo [x] (when (> x 0) (conj (foo (dec x)) x))) 5)


;; ;; -> macro
;; (-> "a" (str "b") (list "c"))

;; (reduce + [1 2 3 4 5])

;; (defn my-reduce [xs f]
;;   (reduce f xs))
;; (-> [1 2 3 4 5] reverse str)

;; (reverse [2 5 4 1 3 6])

;; (rest (reverse [2 5 4 1 3 6]))

;; (list (1 2 3 4 5) 5)

;; (= (__ (sort (rest (reverse [2 5 4 1 3 6]))))
;;    (-> [2 5 4 1 3 6] (reverse) (rest) (sort) (__))
;;    5)

;; (-> [2 5 4 1 3 6] (reverse) (rest) (sort))

;; (drop 2 [1 2 3 4 5])

;; (drop 1 [1 2 3 4 5])

;; (take 1 [1 2 3 4 5])

;; (fn [l] (+ (first l) (last l)))

;; (->> [2 5 4 1 3 6])
;; (->> [2 5 4 1 3 6] (drop 2))
;; (->> [2 5 4 1 3 6] (drop 2) (take 3))
;; (->> [2 5 4 1 3 6] (drop 2) (take 3) (map inc))
;; (->> [2 5 4 1 3 6] (drop 2) (take 3) (map inc) (reduce +))

(loop [x 5 result []]
  (if (> x 0)
    (recur (dec x) (conj result (+ 2 x)))
    result))

(+ 2 4)
(+ (+ 2 4 ) 3)
(+ 5 4 3 2 1 2)


5 4 3 2 1
4 3 2 1 0
6 5 4 3 2

(dec 5)
(conj [] (+ 2 4))

(loop [x 5]
  (dec x)
  (prn x))

(def Map {:a nil})
(nil? (:a Map))

(rem 33 4)

(take 5 (iterate inc 5))
(rem 2 4)

(rem 5 4)

(range 40)

(partition 2 (range 20))

(clojure.set/superset? #{1 2 3} #{1 3 4})

(fn [default sequence]
  
  m)


(for [x [1 2 3]]
  x)

(let [m {} default "x" sequence [1 2 3]]
  (for [item sequence]
    (merge m {item default}))
  )

(hash-map [1 2 3 4])



(fn [seq]
  (second (reverse seq)))


(

 (fn [seq n]
   (loop [seq n]
     (if (= n 0)
       (first seq)
       (recur (cdr seq) (-1 n)))
     ))

 )


(peek (list 1 2 3))

(pop [1 2 3])

(pop (list 1 2 3))

(assoc {:a 1} :b 2 :c 3)

(fn [k s]
  (reduce ))

(merge
 (merge {} {:a 1})
 {:b 2})

(zipmap [:a :b :c] [1 2 3])

(for [key [1 2 3]]
   (conj [key] 0))

(into {}
 (for [key [1 2 3]]
   (conj [key] 0)))


(fn [val seq]
  (into {}
        (for [key seq]
          (conj [key] val))))

(
 (fn [val seq]
   (into {}
         (for [key seq]
           (conj [key] val))))
 0 [:a :b :c])

(
 (fn [val seq]
   (into {}
         (for [key seq]
           (conj [key] val))))
 "x" [1 2 3])

(
 (fn [val seq]
   (into {}
         (for [key seq]
           (conj [key] val))))
 [:a :b] [:foo :bar])


(reduce
 (fn [r x]
   (conj r x))
 []
 [1 2 3])

(let [n 0]
  (reduce
   (fn [total x] (conj total n x))
   []
   [1 2 3]))

(keyword "X")

(array-map
 (let [val "X"]
   (reduce
    (fn [vec key] (conj vec key val))
    []
    [1 2 3])))


(into {} [[:a 0] [:b 0]])

(fn [val keys]
  (into {}
        (reduce (fn [vec key]))))


(fn [seq nth]
  (reduce car seq))

(apply first [1 2 3])

(first [1 2 3])

(fn f [nth args]
  (if (= nth 0)
    (first args)
    (f (-1 nth (rest args)))))

((fn f [nth args]
  (if (= nth 0)
    (first args)
    (f (-1 nth) (rest args))))
 2 '(4 5 6 7))

(defn f1 [coll nth]
  (println nth)
  (if (= nth 0)
    (first coll)
    (f1 (rest coll) (- nth 1))
    ))

(f1 '(4 5 6 7) 2)

(fn f [coll n]
  (if (= n 0)
    (first coll)
    (f (rest coll) (- n 1))
    ))


(- 1 1)


(count "Hello")

(reduce
 
 0
 '(0 1 2 3))

(defn f [cnt coll]
  (if (empty? coll)
    cnt
    (f (+ 1 cnt) (rest coll))))

(f 0 '(0 1 2))
(f 0 "Hello")


(defn f [coll]
  (if (empty? coll)
    0
    (+ 1 (f (rest coll)))))

(f '(0 1 2 3 4 5))

(f "Hello")
(f [[1 2]])

(fn f [coll]
  (if (empty? coll)
    0
    (+ 1 (f (rest coll)))))


(cons 3 [1 2])

(cons 3 '(1 2))

(fn [coll] (reduce + coll))

(apply + [1 2 3])
(apply - [1 2 3])

(odd? 1)
(filter odd? [1 2 3])

(
 (fn [coll] (filter odd? coll))
 (range 10))

(filter odd? [1 2 3])
(filter odd? #{1 2 3 4 5})

(zero? 0)

(
(fn fib [n]
  (if (or (zero? n) (= n 1))
    0
    (+ (fib (- n 1)) (fib (- n 2))))) 10
 )

(defn fib [n]
  (cond
    (zero? n) 0
    (= 1 n) 1
    :else
     (+
      (fib (- n 1))
      (fib (- n 2))
      )))

(fib 10)

(def foo
(fn [n]
  (let [coll '()]
    (fn fib [n]
      (cond
        (= 0 n) 0
        (= 1 n) 1
        :else (+ (fib (- n 1)) (fib (- n 2))))
      )
    (dotimes [x n]
      (prn (fib (+ 1 x)))
      (conj coll (fib x))
      )
    coll
    )
  )
  )

(foo 3)


(sorted-set 3 3 3 2 4)

(reduce #(cons %2 %1) [] [1 2 3])

(defn fib [n]
  (cond
    (zero? n) 0
    (= n 1) 1
    :else (+ (fib (- n 1)) (fib (- n 2)))))

(fib 10)

(fn [n]
  (reduce #(conj %1 ((fn fib [x] (cond (zero? x) 0 (= x 1) 1 :else (+ (fib (- n 1)) (fib (- n 2))))) (+ 1 %2))) [] (range n)))

(reduce #(conj %1 (fib (+ 1 %2))) [] (range 3))

(range 3)
(fib 0)
(fib 1)
(fib 2)
(fib 3)

(+1 1)

(
 (fn [n]
   (fn fib [x] (cond (zero? x) 0 (= x 1) 1 :else (+ (fib (- n 1)) (fib (- n 2)))))
   (reduce #(conj %1 (fib (+ 1 %2))) [] (range n)))
 8)


(first "racecar")

(reduce (fn [char] (.toUpperCase char)) "racecar")

(seq (reverse "racecar"))

(identity \r)

(reduce cons '() "racecar")

(apply str (reverse "racecar"))
(fn [string] (= string (apply str (reverse string))))

(apply str (reverse "racecar"))

(vector \r \a)


(map (fn [a b] (= a b)) "abc" "bbc")

(list 1 2 3)
(list \a \b \c)

(seq 1)
(seq "abc")
(= (seq "aba") (reverse "aba"))

(fn [x] (= (seq x) (reverse x)))

(atom? :a)

(rest [1 2 3])

(fn good [x]
  (cond
    ()))

((fn good [x]
   (if (list? x)
     (good (rest x))
     x)) [1 2 [3]])

