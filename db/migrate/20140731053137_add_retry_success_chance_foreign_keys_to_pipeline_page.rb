class AddRetrySuccessChanceForeignKeysToPipelinePage < ActiveRecord::Migration
  def change
    add_column :pipeline_pages, :success_pipeline_page_id, :integer, index: true
    add_column :pipeline_pages, :fail_pipeline_page_id, :integer, index: true
    add_column :pipeline_pages, :chance_pipeline_page_id, :integer, index: true
  end
end
