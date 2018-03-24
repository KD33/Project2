class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.integer :place_id
      t.text :caption
      t.timestamps
    end
  end
end
