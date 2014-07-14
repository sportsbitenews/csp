class SystemJob < ActiveRecord::Base

  validates :job_type, presence: true

  def self.initiate job_type: nil
    instance = self.new
    instance.status = "new"
    instance.job_type = job_type
    instance.save
    return instance
  end

  def complete item_amount: nil, description: nil
    self.description = description if description.present?
    self.item_amount = item_amount if item_amount.present?
    self.status = "completed"
    self.completed_at = Time.now
    self.save!
  end
end
