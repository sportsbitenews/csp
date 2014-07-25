class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :template
      t.string :functionality
      t.references :page_function_group, index: true
      t.timestamps
    end
  end
end
