class AddDeactivatedToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :deactivated, :boolean, :null => false, :default => false  
  end

  def self.down
    remove_column :users, :deactivated
  end
end
