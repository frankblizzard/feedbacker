class AddClientNrToClient < ActiveRecord::Migration
  def self.up
    add_column :clients, :client_nr, :string
  end

  def self.down
    remove_column :clients, :client_nr
  end
end
