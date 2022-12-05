class AddComentToCalifications < ActiveRecord::Migration[7.0]
  def change
    add_column :califications, :comment, :text
  end
end
