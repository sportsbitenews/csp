class Tag < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :order, :order_id
  
  has_many :order_tags, dependent: :destroy
  has_many :orders, through: :order_tags, dependent: :destroy

  validates :name, presence: true
end
