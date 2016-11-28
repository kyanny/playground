gem 'activemodel', '4.2.7.1'
require 'active_model'
require 'mongo_mapper'
require 'byebug'
require 'logger'

logger = Logger.new(STDOUT)
logger.level = :info
MongoMapper.setup(
             {
               'development' => {
                 'host' => '127.0.0.1',
                 'port' => 27017,
                 'database' => 'testing',
               }
             },
             'development',
             logger: logger
)

class User
  include MongoMapper::Document
  one :membership
end

class Membership
  include MongoMapper::Document
  belongs_to :user
end

class WrapUser < User
end

wrap_user = WrapUser.create!
membership = Membership.create!(user: wrap_user)

wrap_user.reload

MongoMapper.connection.logger.level = :debug
p wrap_user.membership

