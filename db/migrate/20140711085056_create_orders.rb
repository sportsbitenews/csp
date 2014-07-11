class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :email, index: true
      t.string :status
      t.string :locale
      t.string :category, length: 1
      t.text :ga_data
      t.timestamps
    end
  end
end