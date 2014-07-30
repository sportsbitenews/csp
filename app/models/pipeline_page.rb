class PipelinePage < ActiveRecord::Base
  before_validation :add_functionality

  attr_accessible :title, :sequencer
  attr_accessible :pipeline, :pipeline_id, :page, :page_id, :page_function_group, :page_function_group_id

  belongs_to :page_function_group, dependent: :destroy
  belongs_to :pipeline
  belongs_to :page

  validates :pipeline, presence: true
  validates :page, presence: true
  validates :page_function_group, presence: true

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
    self.page_function_group.add_chance_page pipeline_page
  end
  
  def add_fail_page pipeline_page
    self.page_function_group.add_fail_page pipeline_page
  end
  
  def add_success_page pipeline_page
    self.page_function_group.add_success_page pipeline_page
  end

  private
    def add_functionality
      function_group = FunctionGroup.find_by(name: self.page.functionality)
      new_page_function_group = PageFunctionGroup.create!(function_group: function_group, page: self)
      self.page_function_group = new_page_function_group
    end

end