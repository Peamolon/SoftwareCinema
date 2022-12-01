class Cinema < PrimaryRecord
  belongs_to :multiplex, foreign_key: "multiplex_id"
  has_many :cinema_places
end
