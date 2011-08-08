class AddClientIdToPerson < ActiveRecord::Migration
  def self.up
    add_column :people, :client_id, :integer
    add_column :people, :user_id, :integer
  end

  def self.down
    remove_column :people, :client_id
  end
end
