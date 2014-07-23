class Order < ActiveRecord::Base
  include OrderGoogleAnalyticsExt

  attr_accessible :email, :status, :locale, :category, :ga_data
  attr_accessible :logs

  has_many :logs

end