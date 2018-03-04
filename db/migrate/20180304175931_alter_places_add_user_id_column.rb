class AlterPlacesAddUserIdColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :user_id, :integer
    add_index :places, :user_id #for when we want to look things up by a particular field
  end
end
