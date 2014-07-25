class Page < ActiveRecord::Base
  before_validation :add_functionality

  attr_accessible :name, :template, :functionality
  attr_accessible :page_function_group, :page_function_group_id, :logs

  belongs_to :page_function_group, dependent: :destroy

  has_many :pipeline_pages, dependent: :destroy
  has_many :pipelines, through: :pipeline_pages

  has_many :logs

  #validation
  validates :functionality, presence: true
  validates :page_function_group, presence: true

  private
    def add_functionality
      function_group = FunctionGroup.find_by(name: self.functionality)
      new_page_function_group = PageFunctionGroup.create!(function_group: function_group, page: self)
      self.page_function_group = new_page_function_group
    end
end
