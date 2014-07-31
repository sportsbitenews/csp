module OrderProcessExt
  extend ActiveSupport::Concern

  def process_complete
    self.status = "paid"

    self.save!
  end
end