class AddProductOrderIdToProductItem < ActiveRecord::Migration[7.0]
  def change
    add_column :product_items, :product_order_id, :integer
  end
end
