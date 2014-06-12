class Page < ActiveRecord::Base
  attr_accessible :name, :name, :template
  attr_accessible :page_function_group, :page_function_group_id

  has_one :page_function_group
end
