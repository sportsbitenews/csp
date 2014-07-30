class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :template
      t.string :functionality
      t.timestamps
    end
  end
end
