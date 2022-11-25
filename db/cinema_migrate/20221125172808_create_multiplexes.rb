class CreateMultiplexes < ActiveRecord::Migration[7.0]
  def change
    create_table :multiplexes do |t|
      t.string :name
      t.string :address
      t.integer :cinemas_number

      t.timestamps
    end
  end
end
