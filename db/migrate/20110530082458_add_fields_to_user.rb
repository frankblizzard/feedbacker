class AddFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :full_name, :string
    add_column :users, :works_at_eve, :boolean, :default => 0
  end

  def self.down
    remove_column :users, :customer
    remove_column :users, :full_name
  end
end
