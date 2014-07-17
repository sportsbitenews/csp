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
end