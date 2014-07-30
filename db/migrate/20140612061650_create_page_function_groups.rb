class CreatePageFunctionGroups < ActiveRecord::Migration
  def change
    create_table :page_function_groups do |t|
      t.boolean :require_order, default: false
      t.boolean :call_api, default: false
      
      t.integer :retry_pipeline_page_id, index: true
      t.integer :fail_pipeline_page_id, index: true
      t.integer :success_pipeline_page_id, index: true

      t.references :function_group, index: true
      t.timestamps
    end
  end
end
