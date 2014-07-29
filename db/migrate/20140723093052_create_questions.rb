class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :identifier
      t.timestamps
    end
  end
end
