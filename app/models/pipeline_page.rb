class PipelinePage < ActiveRecord::Base

  #Attributes
  attr_accessible :title, :sequencer
  #References
  attr_accessible :pipeline, :pipeline_id, :page, :page_id
  #References with custom Foreign key
  attr_accessible :success_pipeline_page, :retry_pipeline_page, :chance_pipeline_page, :success_pipeline_page_id, :retry_pipeline_page_id, :chance_pipeline_page_id

  belongs_to :pipeline
  belongs_to :page

  belongs_to :success_pipeline_page, class_name: "PipelinePage", foreign_key: "success_pipeline_page_id"
  belongs_to :retry_pipeline_page, class_name: "PipelinePage", foreign_key: "retry_pipeline_page_id"
  belongs_to :chance_pipeline_page, class_name: "PipelinePage", foreign_key: "chance_pipeline_page_id"

  validates :pipeline, presence: true
  validates :page, presence: true

  def set_sequencer sequencer
    raise unless sequencer.is_a? Integer
    self.update_attributes!(sequencer: sequencer)
  end

  def redirect_to_page_params
    return {country: self.pipeline.country.code, locale: self.pipeline.locale, serial: self.pipeline.serial, title: self.title}
  end

  def checkout?
    return self.page.functionality == "checkout" 
  end

  def static?
    return self.page.functionality == "static" 
  end

  def order?
    return self.page.functionality == "order" 
  end

  def success?
    return self.page.functionality == "success" 
  end

  def add_success_page pipeline_page
    raise "AddingIncorrectPageTypeError" unless pipeline_page.success?
    raise "AddingPageToNonCheckoutPageError" unless self.checkout?
    self.update_attributes!(success_pipeline_page: pipeline_page)
  end

  def add_retry_page pipeline_page
    raise "AddingIncorrectPageTypeError" unless pipeline_page.checkout?
    raise "AddingPageToNonCheckoutPageError" unless self.checkout?
    self.update_attributes!(retry_pipeline_page: pipeline_page)
  end
  
  def add_chance_page pipeline_page
    raise "AddingIncorrectPageTypeError" unless pipeline_page.checkout?
    raise "AddingPageToNonCheckoutPageError" unless self.checkout?
    self.update_attributes!(chance_pipeline_page: pipeline_page)
  end

end