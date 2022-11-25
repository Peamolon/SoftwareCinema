class CreatePoints < ActiveRecord::Migration[7.0]
  def change
    create_table :points do |t|
      t.references :product_order, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.integer :count
      t.string :state
      t.string :point_type

      t.timestamps
    end
  end
end
