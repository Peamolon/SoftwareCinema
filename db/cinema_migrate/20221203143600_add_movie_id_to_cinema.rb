class AddMovieIdToCinema < ActiveRecord::Migration[7.0]
  def change
    add_column :cinemas, :movie_id, :integer
  end
end
