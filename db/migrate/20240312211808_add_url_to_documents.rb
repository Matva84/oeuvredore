class AddUrlToDocuments < ActiveRecord::Migration[7.1]
  def change
    add_column :documents, :url, :string
  end
end
