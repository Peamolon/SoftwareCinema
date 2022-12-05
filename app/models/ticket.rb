class Ticket < ApplicationRecord
  belongs_to :cinema_place, foreign_key: "cinema_place_id"
  belongs_to :product_order, foreign_key: "product_order_id"
  include AASM
  aasm column: 'state' do
    state :processing, initial: true
    state :busy
    state :finalized

    event :process do
      transitions from: :free, to: :processing
    end

    event :complete do
      transitions from: :processing, to: :busy
    end

    event :clean do
      transitions from: :busy, to: :free
    end

    event :finish do
      transitions to: :finalized
    end
  end
end
