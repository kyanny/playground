(defn x []
  (for [x (range 10)] x))

(defn fizz? [n]
  (if (zero? (mod n 3))
    "Fizz"
    n))

(defn buzz? [n]
  (if (zero? (mod n 5))
    "Buzz"
    n))

(defn fizzbuzz? [n]
  (if (zero? (mod n 15))
    "FizzBuzz"
    n))

(defn fizzbuzz [n]
  
