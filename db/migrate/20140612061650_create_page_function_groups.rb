class CreatePageFunctionGroups < ActiveRecord::Migration
  def change
    create_table :page_function_groups do |t|
      t.string :name
      t.timestamps
    end
  end
end
