class Answer < ActiveRecord::Base
  attr_accessible :identifier
  attr_accessible :question, :question_id, :logs

  belongs_to :question
  has_many :logs

  validates :identifier, presence: true, uniqueness: true

  def add_operation value
    set_operation "add", value
  end

  def remove_operation value
    set_operation "remove", value
  end

  def content
    return I18n.t "answers.#{self.identifier}"
  end

  private
    def set_operation key, value
      return if Log.find_by(key: key, value: value, answer: self).present? 
      log = Log.create(key: key, value: value, answer: self)
    end
end
