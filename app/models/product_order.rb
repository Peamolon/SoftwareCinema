class ProductOrder < PrimaryRecord
  include AASM
  belongs_to :multiplex
  belongs_to :client
  has_many :product_items
  accepts_nested_attributes_for :product_items, allow_destroy: true, reject_if: :all_blank
  validates_associated :product_items
  has_many :tickets

  aasm column: 'state' do
    state :created, initial: true
    state :paid

    event :paid do
      transitions from: :created, to: :paid
    end
  end

  def paid?
    state == "paid"
  end

  private

end
