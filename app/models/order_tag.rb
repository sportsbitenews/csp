class OrderTag < ActiveRecord::Base
  attr_accessible :order, :order_id, :tag, :tag_id

  belongs_to :order
  belongs_to :tag
end
