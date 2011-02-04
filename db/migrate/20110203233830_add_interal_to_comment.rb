class AddInteralToComment < ActiveRecord::Migration
  def self.up
    add_column :comments, :internal, :boolean
  end

  def self.down
    remove_column :comments, :internal
  end
end
