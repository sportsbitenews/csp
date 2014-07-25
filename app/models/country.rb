class Country < ActiveRecord::Base
  attr_accessible :title, :code, :main
  attr_accessible :orders

  has_many :orders

  validates :code, uniqueness: true

  def self.get_main
    return Country.find_by(main: true)
  end

end