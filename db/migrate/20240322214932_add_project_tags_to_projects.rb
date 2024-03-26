class AddProjectTagsToProjects < ActiveRecord::Migration[7.1]
  def change
    add_column :projects, :project_tags, :string, array: true, default: ["document", "photo"]
  end
end
