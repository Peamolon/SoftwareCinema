class CinemaPlace < PrimaryRecord
  include AASM
  belongs_to :cinema

  aasm column: 'state' do
    state :free, initial: true
    state :processing
    state :busy

    event :process do
      transitions from: :free, to: :processing
    end

    event :complete do
      transitions from: :processing, to: :busy
    end

    event :clean do
      transitions from: :busy, to: :free
    end
  end

  def preference?
    cinema_place_type == "preference"
  end

  def free?
    state == "free"
  end

end
