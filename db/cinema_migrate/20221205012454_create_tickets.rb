class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :state
      t.integer :product_order_id
      t.integer :cinema_place_id

      t.timestamps
    end
  end
end
