class Order < ActiveRecord::Base
  include OrderGoogleAnalyticsExt

  attr_accessible :email, :status, :locale, :category, :ga_data

end
