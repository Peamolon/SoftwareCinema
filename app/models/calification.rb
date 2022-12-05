class Calification < Primary2Record
  belongs_to :movie, foreign_key: "movie_id"
end
