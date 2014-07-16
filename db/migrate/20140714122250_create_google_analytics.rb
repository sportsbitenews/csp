class CreateGoogleAnalytics < ActiveRecord::Migration
  def change
    create_table :google_analytics do |t|
      t.string :category
      t.string :status
      t.string :data
      t.references :payment, index: true
      t.timestamps
    end
  end
end
