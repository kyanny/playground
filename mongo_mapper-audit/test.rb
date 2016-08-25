require 'mongo_mapper'
MongoMapper.database = 'testing'

require 'active_support/concern'

module MongoMapperAudit
  extend ActiveSupport::Concern

  included do
    belongs_to :whodunnit, polymorphic: true, required: true

    before_save do

    end
  end
end

class User
  include MongoMapper::Document
  key :name, String, required: true
end
