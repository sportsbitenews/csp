class FunctionGroup < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :page_function_groups

  has_many :page_function_groups
  TYPES = ['static','order','checkout','success']

  validates :name, uniqueness: true
  validates_inclusion_of :name, :in => TYPES, :message => "{{value}} must be in #{TYPES.join ','}"

end
