class CreateReceipts < ActiveRecord::Migration[8.0]
  def change
    create_table :receipts do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :amount
      t.date :receipt_date, null: false, default: -> { 'CURRENT_DATE' }
      t.timestamps
    end
  end
end
