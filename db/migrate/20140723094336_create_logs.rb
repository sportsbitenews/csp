class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :key
      t.string :value
      t.references :order, index: true
      t.references :answer, index: true
      t.references :page, index: true
      t.references :pipeline, index: true
      t.timestamps
    end
  end
end
