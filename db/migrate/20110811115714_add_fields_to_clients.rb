class AddFieldsToClients < ActiveRecord::Migration
  def self.up
    add_column :clients, :web, :string
    add_column :clients, :notes, :text
  end

  def self.down
    remove_column :clients, :notes
    remove_column :clients, :web
  end
end
