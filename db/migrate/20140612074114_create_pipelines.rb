class CreatePipelines < ActiveRecord::Migration
  def change
    create_table :pipelines do |t|
      t.string :locale
      t.string :status
      t.string :serial
      t.string :group
      t.boolean :main, default: false
      t.references :country, index: true
      t.timestamps
    end
  end
end
