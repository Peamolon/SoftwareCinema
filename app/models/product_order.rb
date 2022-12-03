class ProductOrder < PrimaryRecord
  belongs_to :multiplex
  belongs_to :client
  has_many :product_items
  accepts_nested_attributes_for :product_items, allow_destroy: true, reject_if: :all_blank
  validates_associated :product_items
  after_create :set_value

  private
  def set_value
    value = product_items.joins(:product).pluck("products.price").sum(&:to_f)
    update(value: value)
  end
end
