class Question < ActiveRecord::Base
  attr_accessible :identifier
  attr_accessible :answers

  has_many :answers

  validates :identifier, presence: true, uniqueness: true

  def content
    return I18n.t "questions.#{self.identifier}"
  end

  def add_answer answer
    answer.update_attributes(question_id: self.id)
    self.answers << answer
    self.save
  end
end
