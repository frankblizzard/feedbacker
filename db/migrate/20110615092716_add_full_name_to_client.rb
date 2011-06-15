class AddFullNameToClient < ActiveRecord::Migration
  def self.up
    add_column :clients, :full_name, :string
  end

  def self.down
    remove_column :clients, :full_name
  end
end
