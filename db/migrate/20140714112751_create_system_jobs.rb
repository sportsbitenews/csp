class CreateSystemJobs < ActiveRecord::Migration
  def change
    create_table :system_jobs do |t|
      t.string :status
      t.string :job_type
      t.integer :item_amount
      t.date :completed_at
      t.text :description
      t.timestamps
    end
  end
end
