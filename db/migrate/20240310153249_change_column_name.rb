class ChangeColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :projects, :customer_id, :customer
  end
end
