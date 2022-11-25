class ProductOrder < PrimaryRecord
  belongs_to :multiplex
  belongs_to :client
end
