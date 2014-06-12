class AddProductToPipelines < ActiveRecord::Migration
  def change
    change_table :pipelines do |t|
      t.references :product, index: true
    end
  end
end
