class PageFunctionGroup < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :pages

  has_many :pages
end