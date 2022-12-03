class ProductItem < PrimaryRecord
  belongs_to :product
  belongs_to :product_order, foreign_key: 'product_order_id', optional: true

  def value
    product.price.to_i
  end
end
