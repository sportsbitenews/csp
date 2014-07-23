class Tag < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :order, :order_id
  
  belongs_to :order
end
