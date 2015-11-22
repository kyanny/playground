require './lib'

item = Item.new('taro')
p item
p ItemEntity.new(item)
p ItemEntity.represent(item)
p ItemEntity.new(item).as_json
p ItemEntity.represent(item).as_json
