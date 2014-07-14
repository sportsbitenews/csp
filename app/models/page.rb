class Page < ActiveRecord::Base
  attr_accessible :name, :template
  attr_accessible :page_function_group, :page_function_group_id

  has_one :page_function_group

  has_many :pipeline_pages, dependent: :destroy
  has_many :pipelines, through: :pipeline_pages

end
