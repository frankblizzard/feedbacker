class AddHiddenToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :hidden, :boolean, :default => 0
  end

  def self.down
    remove_column :projects, :hidden
  end
end
