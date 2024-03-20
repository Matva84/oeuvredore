class AddTagsToDocument < ActiveRecord::Migration[7.1]
  def change
    add_column :documents, :tags, :string
  end
end
