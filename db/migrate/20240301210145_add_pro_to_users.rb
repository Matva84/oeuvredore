class AddProToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :pro, :boolean
  end
end
