require 'mongo_mapper'
require 'active_support/all'

require 'logger'
logger = Logger.new(STDOUT)

MongoMapper.setup(
  {
    'development' => {
      'host' => '127.0.0.1',
      'port' => 27017,
      'database' => 'testing',
    }
  }, 'development', logger: logger
)

class SendReceipt
  include MongoMapper::Document
  timestamps!
  key :sent_at, Time
end
SendReceipt.destroy_all

receipt = SendReceipt.create!
sleep 3

t = Time.now.utc
SendReceipt.collection.update(
  { :_id => receipt.id }, { :$set => { sent_at: t, updated_at: t } }
)

p SendReceipt.where(sent_at: t).all
