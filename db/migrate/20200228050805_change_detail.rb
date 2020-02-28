class ChangeDetail < ActiveRecord::Migration[5.0]
  def change
    change_column_default :details, :detail, from: false, to: true
    change_column_default :details, :image, from: false, to: true
    change_column_default :details, :text, from: false, to: true
  end
end
