class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, null: false,foreign_key: true
      t.integer :postage, null: false
      t.integer :total_price, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :receiver, null: false
      t.integer :payment_method, null: false,:default => 1
      t.timestamps
    end
  end
end
