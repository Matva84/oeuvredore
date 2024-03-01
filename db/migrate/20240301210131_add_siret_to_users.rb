class AddSiretToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :siret, :string
  end
end
