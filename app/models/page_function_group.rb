class PageFunctionGroup < ActiveRecord::Base
  attr_accessible :require_order, :call_api
  attr_accessible :pages, :function_group, :function_group_id, :chance_pipeline_page, :chance_pipeline_page_id, :fail_pipeline_page, :fail_pipeline_page_id, :success_pipeline_page, :success_pipeline_page_id

  belongs_to :function_group
  has_one :pipeline_page

  belongs_to :chance_pipeline_page, class_name: "PipelinePage", foreign_key: "chance_pipeline_page_id"
  belongs_to :fail_pipeline_page, class_name: "PipelinePage", foreign_key: "fail_pipeline_page_id"
  belongs_to :success_pipeline_page, class_name: "PipelinePage", foreign_key: "success_pipeline_page_id"

  validates :function_group, presence: true

  # validates :success_pipeline_page, :fail_pipeline_page, presence: true, if: :type_checkout?

  def process

  end

  def add_chance_page pipeline_page
    raise "AddingPipelinePageReferenceToNonCheckoutPage" unless self.type_checkout?
    return if self.chance_pipeline_page == pipeline_page
    self.update_attributes(chance_pipeline_page: pipeline_page)
  end

  def add_fail_page pipeline_page
    raise "AddingPipelinePageReferenceToNonCheckoutPage" unless self.type_checkout?
    return if self.fail_pipeline_page == pipeline_page
    self.update_attributes(fail_pipeline_page: pipeline_page)
  end

  def add_success_page pipeline_page
    raise "AddingPipelinePageReferenceToNonCheckoutPage" unless self.type_checkout?
    return if self.success_pipeline_page == pipeline_page
    self.update_attributes(success_pipeline_page: pipeline_page)
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