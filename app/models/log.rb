class Log < ActiveRecord::Base
  attr_accessible :key, :value
  attr_accessible :order, :order_id, :answer, :answer_id, :page, :page_id, :pipeline, :pipeline_id

  belongs_to :order
  belongs_to :answer
  belongs_to :page
  belongs_to :pipeline

  validates :key, presence: true
end
