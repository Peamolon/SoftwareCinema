class AddStateToProductOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :product_orders, :state, :string
  end
end
