class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.string :name
      t.string :type
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
