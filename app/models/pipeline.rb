class Pipeline < ActiveRecord::Base
  attr_accessible :locale, :status, :serial
  attr_accessible :country, :country_id

  has_one :country
end
