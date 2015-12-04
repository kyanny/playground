require 'grape'
require 'grape-entity'

class HDD
  include Grape::Entity::DSL
  entity :capacity_gb
  entity :rpm

  attr_reader :capacity_gb, :rpm
  def initialize(capacity_gb, rpm)
    @capacity_gb = capacity_gb
    @rpm = rpm
  end
end

class SSD
  include Grape::Entity::DSL
  entity :capacity_gb
  entity :rpm, if: ->(obj, opt) { obj.respond_to?(:rpm) }

  attr_reader :capacity_gb, :rpm
  def initialize(capacity_gb)
    @capacity_gb = capacity_gb
  end
end

class TwitterAPI < Grape::API
  default_format :json

  rescue_from :all do |e|
    error!(e.message)
  end

  helpers do
    def hdds
      hdd1 = HDD.new(500, 5400)
      hdd2 = HDD.new(2000, 7200)
      [hdd1, hdd2]
    end

    def ssds
      ssd1 = SSD.new(256)
      ssd2 = SSD.new(512)
      [ssd1, ssd2]
    end
  end

  get '/1' do
    present (hdds + ssds)
  end

  get '/2' do
    present (ssds + hdds)
  end
end

run TwitterAPI
