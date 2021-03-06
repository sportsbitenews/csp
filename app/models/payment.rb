class Payment < ActiveRecord::Base
  attr_accessible :identifier, :amount, :amount_in_euro, :currency, :provider, :status, :provider_params, :mapped_params, :pay_date, :custom_info, :snd_name, :snd_acc
  attr_accessible :order, :order_id

  belongs_to :order

  # validates :order, presence: true 
end
