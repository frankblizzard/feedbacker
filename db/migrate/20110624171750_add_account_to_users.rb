class AddAccountToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :accountant, :boolean, :default => 0
  end

  def self.down
    remove_column :users, :accountant
  end
end
