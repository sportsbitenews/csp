class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :code
      t.string :title
      t.boolean :main, default: false
      t.timestamps
    end
  end
end
