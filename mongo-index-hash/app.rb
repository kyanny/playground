require 'active_model'
require 'mongo_mapper'
require 'pp'
MongoMapper.database = 'testing'
class Foo
  include MongoMapper::Document
  key :h, Hash
end
Foo.create(h: {a: 1, b: 2})
pp Foo.where('h.a' => 1).explain
puts '------------------------'
class Foo
  include MongoMapper::Document
  key :h, Hash
  ensure_index :h
end
pp Foo.where('h.a' => 1).explain
puts '------------------------'
class Foo
  include MongoMapper::Document
  key :h, Hash
  ensure_index 'h.a'
end
pp Foo.where('h.a' => 1).explain
puts '------------------------'
