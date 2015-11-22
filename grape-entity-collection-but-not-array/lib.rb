require 'grape-entity'

def try(&block)
  puts "-"*80
  yield
rescue => e
  puts e
  puts e.backtrace
ensure
  puts "-"*80
end

class Item
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Items
  include Enumerable

  def initialize(names)
    @names = names
  end

  def each
    @names.each do |name|
      yield Item.new(name)
    end
  end
end

class ItemEntity < Grape::Entity
  expose :name
end

class ItemsEntity < Grape::Entity
  expose :items, using: ItemEntity
end
