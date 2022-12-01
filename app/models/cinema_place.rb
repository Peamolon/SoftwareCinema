class CinemaPlace < PrimaryRecord
  include AASM
  belongs_to :cinema

  aasm column: 'state' do
    state :free, initial: true
    state :busy

    event :take do
      transitions from: :free, to: :busy
    end

    event :clean do
      transitions from: :busy, to: :free
    end
  end

end
