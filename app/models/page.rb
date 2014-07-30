class Page < ActiveRecord::Base

  attr_accessible :name, :template, :functionality
  attr_accessible :logs

  has_many :pipeline_pages, dependent: :destroy
  has_many :pipelines, through: :pipeline_pages

  has_many :logs

  #validation
  validates :functionality, presence: true

end
