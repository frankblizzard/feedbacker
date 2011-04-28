class AddProjectNrToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :project_nr, :string
  end

  def self.down
    remove_column :projects, :project_nr
  end
end
