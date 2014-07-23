class Answer < ActiveRecord::Base
  attr_accessible :I18n_key
  attr_accessible :question, :question_id

  belongs_to :question
end
