class ChangeDataDetailToNull < ActiveRecord::Migration[5.0]
  def change
    change_column :details, :detail, :text, null:false
  end
end
