class Pipeline < ActiveRecord::Base
  attr_accessible :locale, :status, :serial
  attr_accessible :country, :country_id

  belongs_to :country
  belongs_to :product

  has_many :pipeline_pages, dependent: :destroy
  has_many :pages, :through => :pipeline_pages

end