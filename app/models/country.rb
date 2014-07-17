class Country < ActiveRecord::Base
  attr_accessible :title, :code, :main

  def self.get_main
    return Country.find_by(main: true)
  end
end