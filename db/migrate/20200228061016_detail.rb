class Detail < ActiveRecord::Migration[5.0]
  def change
    change_column_default :details, :detail, from: false, to: true
  end
end
