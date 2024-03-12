class AddCustomerToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :customer, :bigint, null: false
    add_reference :projects, :customer, foreign_key: {to_table: :users}
  end
end
