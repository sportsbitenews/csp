class Order < ActiveRecord::Base
  include OrderGoogleAnalyticsExt
  include OrderCategoryExt
  include OrderTagExt

  before_save :assign_category

  attr_accessible :email, :status, :locale, :category, :ga_data
  attr_accessible :logs, :country, :country_id

  belongs_to :country

  has_many :logs, dependent: :destroy
  has_many :tags, dependent: :destroy

  has_many :order_tags, dependent: :destroy
  has_many :tags, through: :order_tags, dependent: :destroy

end