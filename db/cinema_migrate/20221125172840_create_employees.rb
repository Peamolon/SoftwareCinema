class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.references :user, null: false, foreign_key: true
      t.references :mutiplex
      t.string :position
      t.string :rol
      t.date :start_date
      t.string :salary

      t.timestamps
    end
  end
end
