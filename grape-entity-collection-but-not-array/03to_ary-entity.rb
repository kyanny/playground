require './lib'

class Items
  def to_ary
    to_a
  end
end

items = Items.new(['taro', 'hanako'])
p items
p ItemEntity.new(items)
p ItemEntity.represent(items)
try do
  p ItemEntity.new(items).as_json
end
try do
  p ItemEntity.represent(items).as_json
end
p items.map { |item| ItemEntity.new(item) }.as_json
p items.map { |item| ItemEntity.represent(item) }.as_json
