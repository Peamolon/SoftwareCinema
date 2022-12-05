class Cinema < PrimaryRecord
  belongs_to :multiplex, foreign_key: "multiplex_id"
  has_many :cinema_places
  before_create :set_multiplex_number
  has_one :movie, foreign_key: "movie_id"

  def available_places
    cinema_places.where(state: :free).count
  end

  def general_places
    cinema_places.where(state: :free, cinema_place_type: :general).count
  end

  def preference_places
    cinema_places.where(state: :free, cinema_place_type: :preference).count
  end

  private
  def set_multiplex_number
    size = multiplex.cinemas.count
    self.multiplex.update(cinemas_number: size)
  end
end
