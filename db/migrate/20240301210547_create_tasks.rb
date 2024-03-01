class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :start_at
      t.string :end_at
      t.integer :progress
      t.float :budget
      t.integer :dependant_from_task_id
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
