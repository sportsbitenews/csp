class Order < ActiveRecord::Base
  include OrderGoogleAnalyticsExt
  include OrderCategoryExt

  before_save :assign_category

  attr_accessible :email, :status, :locale, :category, :ga_data
  attr_accessible :logs

  has_many :logs
  has_many :tags

end