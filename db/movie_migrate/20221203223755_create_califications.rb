class CreateCalifications < ActiveRecord::Migration[7.0]
  def change
    create_table :califications do |t|
      t.integer :rate
      t.date :date
      t.integer :movie_id

      t.timestamps
    end
  end
end
