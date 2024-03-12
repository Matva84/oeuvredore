class ChangeCustomer < ActiveRecord::Migration[7.1]
  def change
    remove_column :projects, :customer
  end
end
