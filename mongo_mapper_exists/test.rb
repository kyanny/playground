require 'mongo_mapper'
require 'test/unit'

MongoMapper.database = 'testing'
class Name
  include MongoMapper::Document
  key :name, String
end
Name.destroy_all
Name.create!(name: 'foo')

class NameTest < Test::Unit::TestCase
  ["foo", "bar", "foobar", "xfoox", "hi foo ho"].each do |name|
    define_method "test_#{name}" do
      assert Name.exists?(name: /#{name}/)
    end
  end
end
