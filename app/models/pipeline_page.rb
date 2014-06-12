class PipelinePage < ActiveRecord::Base
  attr_accessible :locale, :status, :serial
  attr_accessible :pipeline, :pipeline_id, :page, :page_id

  belongs_to :pipeline
  belongs_to :page

  validates :pipeline, presence: true
  validates :page, presence: true
end