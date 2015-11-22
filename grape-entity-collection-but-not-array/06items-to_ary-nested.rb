require './lib'

class Items
  def to_ary
    to_a
  end

  def items
    to_a
  end
end

items = Items.new(['taro', 'hanako'])
p items
p ItemsEntity.new(items)
p ItemsEntity.represent(items)
try do
  p ItemsEntity.new(items).as_json
end
try do
  p ItemsEntity.represent(items).as_json
end
