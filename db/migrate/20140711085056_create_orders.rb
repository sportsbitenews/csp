class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :email, index: true
      t.string :status, default: "new"
      t.string :locale
      t.integer :category
      t.text :ga_data
      t.references :country, index: true
      t.references :pipeline_page, index: true
      t.timestamps
    end
  end
end