class PageFunctionGroup < ActiveRecord::Base
  attr_accessible :require_order, :call_api
  attr_accessible :pages, :function_group, :function_group_id, :retry_pipeline_page_id, :retry_pipeline_page_id, :fail_pipeline_page, :fail_pipeline_page_id, :success_pipeline_page, :success_pipeline_page_id

  belongs_to :function_group
  has_one :pipeline_page

  has_one :retry_pipeline_page_id, class_name: "PipelinePage", foreign_key: "retry_pipeline_page_id"
  has_one :fail_pipeline_page, class_name: "PipelinePage", foreign_key: "fail_pipeline_page_id"
  has_one :success_pipeline_page, class_name: "PipelinePage", foreign_key: "success_pipeline_page_id"

  validates :function_group, presence: true

  # validates :success_pipeline_page, :fail_pipeline_page, presence: true, if: :type_checkout?

  def add_charge_page
    
  end

  def add_fail_page
    
  end

  def add_success_page
    
  end

  def type_static?
    return self.function_group.name == "static"
  end

  def type_order?
    return self.function_group.name == "order"
  end

  def type_checkout?
    return self.function_group.name == "checkout"
  end

  def type_success?
    return self.function_group.name == "success"
  end

end