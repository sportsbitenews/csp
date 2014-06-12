class Product < ActiveRecord::Base
  attr_accessible :name, :url

  has_many :pipelines
end