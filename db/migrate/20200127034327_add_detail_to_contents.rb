class AddDetailToContents < ActiveRecord::Migration[5.0]
  def change
    add_column :contents, :detail, :text, null:false
    add_column :contents, :image, :text
    add_column :contents, :text, :text
  end
end
