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

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def male?
    return self.gender == "male"
  end

  def female?
    return self.gender == "female"
  end

  def add_pipeline_page pipeline_page_id
    pipeline_page = PipelinePage.find pipeline_page_id
    self.pipeline_page = pipeline_page
    self.save
  end

  def pipeline
    return self.pipeline_page.pipeline
  end

  def process_answers params
    return unless params.present?
    params.each do |question_id, answer_id|
      answer = Answer.find answer_id

      answer.logs.each do |log|
        pr log.inspect
        if log.key == "add"
          self.add_tag log.value
        elsif log.key == "remove"
          self.remove_tag log.value
        end
      end
    end
  end

end