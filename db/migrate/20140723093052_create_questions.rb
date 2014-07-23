class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :I18n_key
      t.timestamps
    end
  end
end
