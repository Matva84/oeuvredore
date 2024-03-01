class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.string :address
      t.date :start_at
      t.date :end_at
      t.date :initial_start_at
      t.date :initial_end_at
      t.float :customer_budget
      t.float :total_expenses
      t.integer :progress
      t.float :longitude
      t.float :latitude
      t.integer :customer_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
