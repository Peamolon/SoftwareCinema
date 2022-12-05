class CinemaPlace < PrimaryRecord
  belongs_to :cinema
  has_one :user, foreign_key: "user_id"
  has_many :tickets


  def processing?
    tickets.where(state: :processing).present?
  end

  def preference?
    cinema_place_type == "preference"
  end

  def free?
    !tickets.where(state: [:processing, :busy]).present?
  end

end
