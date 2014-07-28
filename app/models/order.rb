class Order < ActiveRecord::Base
  include OrderGoogleAnalyticsExt
  include OrderCategoryExt
  include OrderTagExt
  include OrderVirtualAttributesExt

  before_save :assign_category

  attr_accessor :test

  attr_accessible :email, :status, :locale, :category, :ga_data
  attr_accessible :logs, :tags, :country, :country_id, :pipeline_page, :pipeline_page_id

  belongs_to :country
  belongs_to :pipeline_page

  has_many :logs, dependent: :destroy
  has_many :tags, dependent: :destroy

  has_many :order_tags, dependent: :destroy
  has_many :tags, through: :order_tags, dependent: :destroy

  def add_pipeline_page pipeline_page_id
    pipeline_page = PipelinePage.find pipeline_page_id
    self.pipeline_page = pipeline_page
    self.save
  end

  def pipeline
    return self.pipeline_page.pipeline
  end

end