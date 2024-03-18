class AddCloudinaryIdToDocuments < ActiveRecord::Migration[7.1]
  def change
    add_column :documents, :cloudinary_id, :string
  end
end
