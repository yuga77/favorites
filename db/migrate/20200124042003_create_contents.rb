class CreateContents < ActiveRecord::Migration[5.0]
  def change
    create_table :contents do |t|
      t.integer :genre_id , foreign_key: true, unique: true
      t.text :title, null:false
      t.timestamps
    end
  end
end
