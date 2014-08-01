class Order < ActiveRecord::Base
  include OrderHelperMethodsExt
  include OrderGoogleAnalyticsExt
  include OrderCategoryExt
  include OrderTagExt
  include OrderVirtualAttributesExt
  include OrderBodyFormulasExt
  include OrderProcessExt

  before_save :assign_category, :set_email_to_downcase

  attr_accessor :test, :requires_email_validation

  attr_accessible :email, :status, :locale, :category, :ga_data
  attr_accessible :logs, :country, :country_id, :pipeline_page, :pipeline_page_id

  belongs_to :country
  belongs_to :pipeline_page

  has_many :logs, dependent: :destroy
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, if: :validate_email?

  def add_pipeline_page pipeline_page_id
    self.update_attributes!(pipeline_page_id: pipeline_page_id)
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

  def assign_country_and_locale country, locale
    self.locale ||= locale
    self.country ||= country
  end

  def assign_ga_data ga_data
    self.ga_data ||= ga_data.to_s
  end

  private
    def set_email_to_downcase
      self.email = self.email.downcase if self.email.present?
    end

    def validate_email?
      self.requires_email_validation
    end
end