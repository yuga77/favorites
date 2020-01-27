class CreateDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :details do |t|
      t.string :detail
      t.string :image
      t.string :text
      t.references :genre, foreign_key: true
      t.references :content, foreign_key: true
      t.timestamps
    end
  end
end
