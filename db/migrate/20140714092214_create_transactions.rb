class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :identifier
      t.integer :amount
      t.float :amount_in_euro
      t.string :currency
      t.string :provider
      t.string :status
      t.string :snd_name
      t.string :snd_acc
      t.text :provider_params
      t.text :mapped_params
      t.date :pay_date
      t.string :custom_info
      t.references :order, index: true
      t.timestamps
    end
  end
end