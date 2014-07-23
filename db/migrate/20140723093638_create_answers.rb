class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :I18n_key
      t.references :question, index: true
      t.timestamps
    end
  end
end
