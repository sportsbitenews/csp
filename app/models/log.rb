class Log < ActiveRecord::Base
  attr_accessible :key, :value
  attr_accessible :order, :order_id, :question, :question_id, :page, :page_id, :pipeline, :pipeline_id

  belongs_to :order
  belongs_to :question
  belongs_to :page
  belongs_to :pipeline

  validates :key, presence: true
end
