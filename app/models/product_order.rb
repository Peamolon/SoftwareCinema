class ProductOrder < PrimaryRecord
  belongs_to :multiplex
  belongs_to :client
  has_many :product_items
  accepts_nested_attributes_for :product_items, allow_destroy: true, reject_if: :all_blank
  validates_associated :product_items
end
