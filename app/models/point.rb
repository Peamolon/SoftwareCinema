class Point < PrimaryRecord
  belongs_to :product_order
  belongs_to :client
end
