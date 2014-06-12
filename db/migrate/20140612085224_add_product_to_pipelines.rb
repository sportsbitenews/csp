class AddProductToPipelines < ActiveRecord::Migration
  def change
    change_table :pipelines do |t|
      t.references :payment_system, index: true
    end
  end
end
