require 'active_support/all'
Time.zone = 'UTC'
require 'mongo_mapper'
MongoMapper.database = 'testing'
class Foo
  include MongoMapper::Document
  key :sent_at, Time

  before_create :send_invitation

  def send_invitation
    @sent_at = Time.zone.now
    save unless new?
  end
end

p '-'*78
Foo.destroy_all
foo = Foo.create
p foo
p Foo.collection.find().each.map{|foo| foo }

p '-'*78
Foo.destroy_all
foo = Foo.new
foo.save
p foo
p Foo.collection.find().each.map{|foo| foo }
