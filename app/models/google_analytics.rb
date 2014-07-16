class GoogleAnalytics < ActiveRecord::Base
  attr_accessible :category, :data, :status
  attr_accessible :payment, :payment_id

  belongs_to :payment
end