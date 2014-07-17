class CreatePipelinePages < ActiveRecord::Migration
  def change
    create_table :pipeline_pages do |t|
      t.references :pipeline, index: true
      t.references :page, index: true
      t.string :title
      t.integer :sequencer
      t.timestamps
    end
  end
end
