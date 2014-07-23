class CreateOrderTags < ActiveRecord::Migration
  def change
    create_table :order_tags do |t|
      t.references :order, index: true
      t.references :tag, index: true
      t.timestamps
    end
  end
end
