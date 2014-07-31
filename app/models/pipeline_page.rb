class PipelinePage < ActiveRecord::Base

  attr_accessible :title, :sequencer
  attr_accessible :pipeline, :pipeline_id, :page, :page_id

  belongs_to :pipeline
  belongs_to :page

  validates :pipeline, presence: true
  validates :page, presence: true

  def set_sequencer sequencer
    raise unless sequencer.is_a? Integer
    self.update_attributes!(sequencer: sequencer)
  end

  def redirect_to_page_params
    return {country: self.pipeline.country.code, locale: self.pipeline.locale, serial: self.pipeline.serial, title: self.title}
  end

  def process
    self.page_function_group.process
  end

  def checkout?
    return self.page_function_group.type_checkout?    
  end

  def static?
    return self.page_function_group.type_static?    
  end

  def order?
    return self.page_function_group.type_order?    
  end

  def success?
    return self.page_function_group.type_success?    
  end

  def add_chance_page pipeline_page

  end
  
  def add_retry_page pipeline_page

  end
  
  def add_success_page pipeline_page

  end

end