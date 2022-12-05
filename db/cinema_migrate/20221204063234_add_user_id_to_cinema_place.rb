class AddUserIdToCinemaPlace < ActiveRecord::Migration[7.0]
  def change
    add_column :cinema_places, :user_id, :integer
  end
end
