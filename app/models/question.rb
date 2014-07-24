class Question < ActiveRecord::Base
  attr_accessible :I18n_key, :identifier
  attr_accessible :answers, :logs

  has_many :answers
  has_many :logs
end
