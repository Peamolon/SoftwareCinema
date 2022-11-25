class CreateCinemaPlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :cinema_places do |t|
      t.references :cinema, null: false, foreign_key: true
      t.string :type
      t.string :price
      t.string :state

      t.timestamps
    end
  end
end
