class CreateProductOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :product_orders do |t|
      t.references :multiplex, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.string :detail
      t.date :date
      t.string :type
      t.string :value

      t.timestamps
    end
  end
end
