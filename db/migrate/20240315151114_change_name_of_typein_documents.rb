class ChangeNameOfTypeinDocuments < ActiveRecord::Migration[7.1]
  def change
    rename_column :documents, :type, :type_of_document
  end
end
