class Question < ActiveRecord::Base
  attr_accessible :I18n_key
  attr_accessible :answers

  has_many :answers
end
