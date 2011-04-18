class ChangeProjectsDate < ActiveRecord::Migration
  def self.up
    change_column :projects, :started_at, :date
    change_column :projects, :ends_at, :date
  end

  def self.down
        change_column :projects, :started_at, :datetime
        change_column :projects, :ends_at, :datetime
  end
end
