require 'pp'
pp [
  [1,2,3].select{|n|n.odd?},
  [1,2,3].select!{|n|n.odd?},
  [1,2,3].keep_if{|n|n.odd?},
  [1,3,5].select{|n|n.odd?},
  [1,3,5].select!{|n|n.odd?},
  [1,3,5].keep_if{|n|n.odd?},
]
